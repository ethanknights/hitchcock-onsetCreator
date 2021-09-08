function run_03_writeMovie(raterStr,stimStr,nFramesToWrite)

rootDir = fullfile('data',raterStr,stimStr,['nFrames-',num2str(nFramesToWrite)]);
fN = fullfile(rootDir,'frames.mat');
load(fN,'frames');

oN = fullfile(rootDir,'movie.avi');

tmpDir = fullfile('tmp'); system(sprintf('rm -rf %s',tmpDir)); mkdir(tmpDir);


for fNum = 1:11970
  if frames(fNum) == true
    cmdStr = sprintf('cp %s %s',...
      fullfile('../','01_convertMovieToFrames','data',[num2str(fNum,'%05.f'),'.jpg']),...
      fullfile(tmpDir) ...
      );
    system(cmdStr);
  end
end

%remove leading 0 for python to make movie in correct order
dirContents = dir(fullfile(tmpDir,'*.jpg'));
for fNum = 1:length(dirContents)
  
  fN = fullfile(dirContents(fNum).folder,dirContents(fNum).name);
  newStr = strip(dirContents(fNum).name,'left','0');
  
  system(sprintf('mv %s %s',...
    fN,...
    fullfile(dirContents(fNum).folder,newStr)...
    ));
end


%% Write Video - Too Much Storage Wasted with matlab approach
% dirContents = dir(fullfile(tmpDir,'*.jpg'));
% 
% images    = cell(length(dirContents),1); %init
% for i=1:length(dirContents)
%   images{i} = imread(fullfile(dirContents(i).folder,dirContents(i).name));
% end
% create the video writer with 30 fps
% writerObj = VideoWriter(oN);
% writerObj.FrameRate = 30;
% open the video writer
% open(writerObj);
% write the frames to the video
% for u=1:length(dirContents)
%   convert the image to a frame
%   frame = im2frame(images{u});
%   for v=1:length(dirContents)
%     writeVideo(writerObj, frame);
%   end
% end
% close the writer object
% close(writerObj);
% implay(oN);

return
