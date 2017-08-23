function [ x, minObj ] = solveOneMS(TOA)
%solveOneMS ��һ��TOA���ݽ������
%Input:
%   TOA: һ��TOA����
global xBS_m m beta r

r = TOA(1:m) * (3*10e8);
yita = 0.5 * ones(1,m);
T = 100;  % ��������
minObj = Inf;
for k = 1:T
    epsilon = normrnd(0,1);
    beta = yita + (1-yita)*epsilon;
    % ������Լ����ά�Ż��㷨
    [x_tmp,fval_tmp] = fminsearch(@myfun,mean(xBS_m),optimset('MaxFunEvals',1000));
    if fval_tmp < minObj
        minObj = fval_tmp;
        x = x_tmp;
    end
end

end


function [ obj ] = myfun( x )
global m xBS_m beta r

normVec = sum(abs(repmat(x,m,1)-xBS_m).^2,2).^(1/2);
%{
for i = 1:M
    normVec(i) = norm(x-xBS(i,:));
end
%}
obj = sum((beta.*r - normVec').^2);

end