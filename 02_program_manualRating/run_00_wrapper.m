%% ========================================================================
%% Outputs include:
%% - frames.mat (to create onsets): data/EK/Face/nFrames-30/frames.mat
%% - A movie:                       data/EK/Face/nFrames-30/stimMovie.avi
%% ========================================================================


%% --------------
%% SETUP
%% Rater - EK
%% --------------
raterStr = 'EK';
stimStr = 'Face';
nFramesToWrite = 30;  %ideally divisible by 11970 frames. Small = accuracy


%% ========================================================================
%% Routine
%% ========================================================================
run_01_codeFrames(raterStr,stimStr,nFramesToWrite)
run_02_gatherData(raterStr,stimStr,nFramesToWrite)
run_03_writeMovie(raterStr,stimStr,nFramesToWrite)
%% In anaconda: python run_03_writeMovie.py
movefile('project.avi',...
  fullfile('data',raterStr,stimStr,['nFrames-',num2str(nFramesToWrite)],'stimMovie.avi'));
rmdir('tmp','s')