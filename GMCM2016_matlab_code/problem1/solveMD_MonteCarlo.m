function [x,minObj] = solveMD_MonteCarlo( TOA )
global N M xBS beta r
M = size(xBS,1);
N = size(TOA,1);
x = zeros(N,3);
for i = 1:50
    r = TOA(i,:) * (3*1e8);
    yita = 0.5 * ones(1,M);
    T = 100;  % 迭代次数
    tmpx = zeros(T,3);
    minObj = Inf;
    tic
    for k = 1:T
        epsilon = normrnd(0,1);
        beta = yita + (1-yita)*epsilon;
        % 调用无约束多维优化算法
        [x_f,fval] = fminsearch(@gfun,mean(xBS),optimset('MaxFunEvals',1000));
        %---------------------------------------------
        % 经过大量实验，fminsearch的性能是最好的 (T=100时,一次定位耗时约1.5s)
        %其他算法性能(T=100时，一次定位耗时)：
        % lsqnonlin: 约4.7s
        % fminunc: 越1.8s
        %一些全局搜索算法的性能(T=100时，一次定位耗时)：
        % Direct Search (patternsearch): 约15s
        % Particle Swarm (particleswarm): 约4.5s
        % Genitic Algorithm (ga): 约60s
        % Simulated Annealing (simulannealbnd): 超过120s
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
    toc
end

global samplecase001ans
plot(x(1:50,1)), hold on
plot(samplecase001ans(1:50,1))
figure,
plot(x(1:50,2)), hold on
plot(samplecase001ans(1:50,2))
figure,
plot(x(1:50,3)), hold on
plot(samplecase001ans(1:50,3))
hold off

end


function [ obj ] = gfun( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global M xBS beta r

normVec = sum(abs(repmat(x,M,1)-xBS).^2,2).^(1/2);
%{
for i = 1:M
    normVec(i) = norm(x-xBS(i,:));
end
%}
obj = sum((beta.*r - normVec').^2);

end
