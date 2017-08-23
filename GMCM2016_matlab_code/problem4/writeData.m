%path是待输入的路径和文件名，outputData是需要写入的结果
function[] = writeData(path,outputData)
    filenameID = fopen(path, 'a');    %以追加模式写文件
    [m, n] = size(outputData);
    for i = 1: m
        for j = 1: n
            if n ~= 14 
                fprintf(filenameID, '%10.4f', outputData(i, j));
            else
                fprintf(filenameID, '%s', outputData(i, j));
            end
        end
        fprintf(filenameID, '\n');    %用于写完一行之后换行
    end
    fclose(filenameID);
end