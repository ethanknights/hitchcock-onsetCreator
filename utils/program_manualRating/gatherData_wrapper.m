% allFrames = [];
% % gatherData('JL','onlyFACE')
% % gatherData('JL','onlyHAND')
% % gatherData('JL','onlyOBJECT')
% writeMovie('JL','onlyFACE')
% writeMovie('JL','onlyHAND')
% writeMovie('JL','onlyOBJECT')
% 
% load('data/eventFiles/JLonlyFACE.mat');     allFrames(1,:) = frames;
% load('data/eventFiles/JLonlyHAND.mat');     allFrames(2,:) = frames;
% load('data/eventFiles/JLonlyOBJECT.mat');   allFrames(3,:) = frames;
% 
% figure
% subplot(3,1,1); plot(allFrames(1,:)); ylim([-1 2]); title('JLonlyFACE');
% subplot(3,1,2); plot(allFrames(2,:)); ylim([-1 2]); title('JLonlyHAND');
% subplot(3,1,3); plot(allFrames(3,:)); ylim([-1 2]); title('JLonlyOBJECT');
  



return
gatherData('EK','onlyFACE')
writeMovie('EK','onlyFACE')
% python writeMovie.py
% gatherData('EK','onlyHAND')
% gatherData('EK','onlyOBJECT')