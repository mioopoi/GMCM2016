for a = 26 : 30
    if a < 10
        filename = strcat('case00',num2str(a),'_input.txt');
        loadname = strcat('case00',num2str(a),'predict.mat');
    else
        filename = strcat('case0',num2str(a),'_input.txt');
        loadname = strcat('case0',num2str(a),'predict.mat');
    end

[xBS, TOA] = readData(filename);
tempTOALine2 = load(loadname);
tempTOALine2 = tempTOALine2.predictLabel;
[m,n] = size(TOA);

temp = regexp(filename, '_', 'split');
casename = char(temp(1));
cases = casename(1:4);
num = casename(5: 7);
nan = ['xnan ynan znan'];       
finalLocation = zeros(m,3);
    for i = 1 : m
          if tempTOALine2(i,1) > 0
              tempTOAline = TOA(i,:);
              [x, minObj] = solveMD_MonteCarlo2(tempTOAline,xBS);
              writeData(strcat('./output_',cases, '_', num, '.txt'), x);
          else
              writeData(strcat('./output_',cases, '_', num, '.txt'), nan);
          end
    end;
end;