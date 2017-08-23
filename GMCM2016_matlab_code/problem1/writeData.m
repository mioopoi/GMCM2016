%path是待输入的路径和文件名，outputData是需要写入的结果
function[] = writeData(path,outputData)
    filename = fopen(path, 'w');    %以写模式写文件
    [m, n] = size(outputData);
    for i = 1: m
        for j = 1: n
            fprintf(filename, '%10.4f', outputData(i, j));
        end
        fprintf(filename, '\n');    %用于写完一行之后换行
    end
    fclose(filename);
end