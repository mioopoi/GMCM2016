function [x,minObj] = solveMD_MonteCarlo2( TOA ,tempXBS)
global N M xBS1 beta r
xBS1 = tempXBS
xBS = tempXBS;
M = size(xBS1,1);
N = size(TOA,1);
x = zeros(N,3);
for i = 1:N
    r = TOA(i,:) * (3*1e8);
    yita = 0.5 * ones(1,M);
    T = 100;  % ��������
    tmpx = zeros(T,3);
    minObj = Inf;
    
    for k = 1:T
        epsilon = normrnd(0,1);
        beta = yita + (1-yita)*epsilon;
        % ������Լ����ά�Ż��㷨
        [x_f,fval] = fminsearch(@gfun,mean(xBS1),optimset('MaxFunEvals',1000));
        %---------------------------------------------
        % ��������ʵ�飬fminsearch����������õ� (T=100ʱ,һ�ζ�λ��ʱԼ1.5s)
        %�����㷨����(T=100ʱ��һ�ζ�λ��ʱ)��
        % lsqnonlin: Լ4.7s
        % fminunc: Խ1.8s
        %һЩȫ�������㷨������(T=100ʱ��һ�ζ�λ��ʱ)��
        % Direct Search (patternsearch): Լ15s
        % Particle Swarm (particleswarm): Լ4.5s
        % Genitic Algorithm (ga): Լ60s
        % Simulated Annealing (simulannealbnd): ����120s
        %---------------------------------------------
        %nvars = 3;
        %[x_f,fval,exitflag] = fminunc(@gfun,mean(xBS));
        %[x_f,fval,exitflag] = lsqnonlin(@gfun,mean(xBS));
        %[x_f,fval,exitflag] = particleswarm(@gfun,nvars);
        %[x_f,fval,exitflag] = patternsearch(@gfun,mean(xBS));
        %[x_f,fval,exitflag] = ga(@gfun,nvars);
        %[x_f,fval,exitflag] = simulannealbnd(@gfun,mean(xBS));
        tmpx(k,:) = x_f;
        if fval < minObj
            minObj = fval;
            x(i,:) = tmpx(k,:);
        end
    end
   
end

end


function [ obj ] = gfun( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global M xBS1 beta r

normVec = sum(abs(repmat(x,M,1)-xBS1).^2,2).^(1/2);
%{
for i = 1:M
    normVec(i) = norm(x-xBS(i,:));
end
%}
obj = sum((beta.*r - normVec').^2);

end
