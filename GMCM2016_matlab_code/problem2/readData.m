%inputData�Ǵ�����ľ���ע�ⲻ��txt���ļ������ǵ����ľ���
function[xBS, TOA] = readData(inputData)
    bs_num = inputData(1,1);    %��վ����
    ms_num = inputData(2,1);    %�ն�����
    dimension = inputData(3,1); %ά��
    xBS = inputData(4:(3+bs_num), 1:dimension);
    TOA = inputData(4+bs_num: 3+bs_num+ms_num, 1:bs_num);
end
