clc
% 注意：这是对一个文件进行处理
% 说明：之前要将sample_case001_ans以矩阵形式导入Matlab工作区
% 处理完之后请保存meanERR
global xBS_m m
[xBS, TOA] = readData(samplecase005input);
N = size(TOA,1); % 终端数
M = size(xBS,1); % 基站数
numSample = 100;  % 抽样数，大约运行40min
tic
selectedOrder = randperm(N);
locationDB = cell(numSample,M);  % 存放定位结果的元胞数组
ERR = zeros(numSample,M);   % 存放定位误差的矩阵

step = 2;  % 基站数步长
for i = 1:numSample
    idMS = selectedOrder(i);  % 第i次抽样的终端ID
    for m = 3:step:M  % 依次增加基站数，第m次循环取前m个基站
        xBS_m = xBS(1:m,:);  % 取前m个基站坐标
        [x,minObj] = solveOneMS(TOA(idMS,:));  % 调用定位算法对一个终端进行定位
        ERR(i,m) = norm(x-samplecase001ans(idMS,:));
        locationDB{i,m} = x;  % 存放定位结果
    end
end
toc

newERR = ERR(:,3:step:M);
meanERR = mean(newERR);
%plot(3:step:M, meanERR, '-o', 'LineWidth',1.25), hold on
%xlabel('参与定位的基站数'), ylabel('RMSE')
