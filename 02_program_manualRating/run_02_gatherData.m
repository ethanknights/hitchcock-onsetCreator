function run_02_gatherData(raterStr,stimStr,nFramesToWrite)

rootDir = fullfile('data',raterStr,stimStr,['nFrames-',num2str(nFramesToWrite)]);
oN = fullfile(rootDir,'frames.mat')

for fNum = 1:11970
  fileID = fopen(fullfile(rootDir,[stimStr,num2str(fNum),'.txt']));
  frames(fNum) = fread(fileID);
  fclose(fileID);
end
frames = frames == 49; %TRUE
save(oN,'frames');

%% boolPlot(double(frames))