%path�Ǵ������·�����ļ�����outputData����Ҫд��Ľ��
function[] = writeData(path,outputData)
    filenameID = fopen(path, 'a');    %��׷��ģʽд�ļ�
    [m, n] = size(outputData);
    for i = 1: m
        for j = 1: n
            if n ~= 14 
                fprintf(filenameID, '%10.4f', outputData(i, j));
            else
                fprintf(filenameID, '%s', outputData(i, j));
            end
        end
        fprintf(filenameID, '\n');    %����д��һ��֮����
    end
    fclose(filenameID);
end