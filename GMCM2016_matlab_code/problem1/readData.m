%inputData是待输入的矩阵，注意不是txt的文件，而是导入后的矩阵
function[xBS, TOA] = readData(inputData)
    bs_num = inputData(1,1);    %基站数量
    ms_num = inputData(2,1);    %终端数量
    dimension = inputData(3,1); %维度
    xBS = inputData(4:(3+bs_num), 1:dimension);
    TOA = inputData(4+bs_num: 3+bs_num+ms_num, 1:bs_num);
end
