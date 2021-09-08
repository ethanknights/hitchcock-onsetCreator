% allFrames = [];
% % gatherRater_textFiles('JL','onlyFACE')
% % gatherRater_textFiles('JL','onlyHAND')
% % gatherRater_textFiles('JL','onlyOBJECT')
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
gatherRater_textFiles('EK','onlyFACE')
writeMovie('EK','onlyFACE')
% python writeMovie.py
% gatherRater_textFiles('EK','onlyHAND')
% gatherRater_textFiles('EK','onlyOBJECT')