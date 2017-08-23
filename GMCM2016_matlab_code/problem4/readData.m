%inputData是待输入的矩阵，注意不是txt的文件，而是导入后的矩阵
function[xBS, TOA] = readData(inputfile)


	fileID = fopen(inputfile,'r');
	line1 = fgetl(fileID);
	line1 = str2num(line1);
	formatSpec = '';
	for a = 1 : line1
		formatSpec = strcat(formatSpec, '%f');
	end;
	formatSpec = strcat(formatSpec, '%[^\n\r]');
	delimiter = '\t';
	dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
	fclose(fileID);
	inputData = [dataArray{1:end-1}];
	clearvars  delimiter formatSpec fileID dataArray ans a;
    bs_num = line1;
    ms_num = int16(inputData(1,1));    %基站数量
    dimension = int16(inputData(2,1));    %终端数量
    xBS = inputData(3:(2+bs_num), 1:dimension);
    TOA = inputData(3+bs_num: 2+bs_num+ms_num, 1:bs_num);
end
