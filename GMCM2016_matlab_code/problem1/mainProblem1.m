clc
%file=dir('C:\Users\Takashi\Documents\MATLAB\GMCM2016\sample_data\*.txt');
%case001input = importfile(strcat('sample_data\',file(1).name),1,1133);

global xBS
%% sample
[xBS, TOA] = readData(samplecase001input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\sampleoutput\sampleoutput_case_001.txt',x)
toc

[xBS, TOA] = readData(samplecase002input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\sampleoutput\sampleoutput_case_002.txt',x)
toc

[xBS, TOA] = readData(samplecase003input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\sampleoutput\sampleoutput_case_003.txt',x)
toc

[xBS, TOA] = readData(samplecase004input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\sampleoutput\sampleoutput_case_004.txt',x)
toc

[xBS, TOA] = readData(samplecase005input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\sampleoutput\sampleoutput_case_005.txt',x)
toc

%% data
[xBS, TOA] = readData(case001input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_001.txt',x)
toc

[xBS, TOA] = readData(case002input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_002.txt',x)
toc

[xBS, TOA] = readData(case003input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_003.txt',x)
toc

[xBS, TOA] = readData(case004input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_004.txt',x)
toc

[xBS, TOA] = readData(case005input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_005.txt',x)
toc

[xBS, TOA] = readData(case006input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_006.txt',x)
toc

[xBS, TOA] = readData(case007input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_007.txt',x)
toc

[xBS, TOA] = readData(case008input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_008.txt',x)
toc

[xBS, TOA] = readData(case009input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_009.txt',x)
toc

[xBS, TOA] = readData(case010input);
tic
[x,minObj] = solveMD_MonteCarlo( TOA );
writeData('C:\Users\Takashi\Documents\MATLAB\GMCM2016\output\output_case_010.txt',x)
toc