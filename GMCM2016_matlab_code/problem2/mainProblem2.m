clc
% ע�⣺���Ƕ�һ���ļ����д���
% ˵����֮ǰҪ��sample_case001_ans�Ծ�����ʽ����Matlab������
% ������֮���뱣��meanERR
global xBS_m m
[xBS, TOA] = readData(samplecase005input);
N = size(TOA,1); % �ն���
M = size(xBS,1); % ��վ��
numSample = 100;  % ����������Լ����40min
tic
selectedOrder = randperm(N);
locationDB = cell(numSample,M);  % ��Ŷ�λ�����Ԫ������
ERR = zeros(numSample,M);   % ��Ŷ�λ���ľ���

step = 2;  % ��վ������
for i = 1:numSample
    idMS = selectedOrder(i);  % ��i�γ������ն�ID
    for m = 3:step:M  % �������ӻ�վ������m��ѭ��ȡǰm����վ
        xBS_m = xBS(1:m,:);  % ȡǰm����վ����
        [x,minObj] = solveOneMS(TOA(idMS,:));  % ���ö�λ�㷨��һ���ն˽��ж�λ
        ERR(i,m) = norm(x-samplecase001ans(idMS,:));
        locationDB{i,m} = x;  % ��Ŷ�λ���
    end
end
toc

newERR = ERR(:,3:step:M);
meanERR = mean(newERR);
%plot(3:step:M, meanERR, '-o', 'LineWidth',1.25), hold on
%xlabel('���붨λ�Ļ�վ��'), ylabel('RMSE')
