%path�Ǵ������·�����ļ�����outputData����Ҫд��Ľ��
function[] = writeData(path,outputData)
    filename = fopen(path, 'w');    %��дģʽд�ļ�
    [m, n] = size(outputData);
    for i = 1: m
        for j = 1: n
            fprintf(filename, '%10.4f', outputData(i, j));
        end
        fprintf(filename, '\n');    %����д��һ��֮����
    end
    fclose(filename);
end