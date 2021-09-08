function writeMovie(raterStr,eventStr)

fN = fullfile('data',[raterStr,eventStr,'.mat']);

outDir = fullfile('data','eventFiles'); if ~exist(outDir); mkdir(outDir); end
tmpDir = fullfile('data','eventFiles','tmp'); system(sprintf('rm -rf %s',tmpDir)); mkdir(tmpDir);

load(fullfile(outDir,[raterStr,eventStr,'.mat']));
oN = fullfile(outDir,[raterStr,eventStr,'.avi']);

for fNum = 1:11972
  if frames(fNum) == true
    cmdStr = sprintf('cp %s %s',...
      fullfile('rawData','video_to_frames','test',[num2str(fNum,'%05.f'),'.jpg']),...
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

% system('python writeMovie.py')
% 
% % load the images
% images    = cell(length(dirContents),1);
% for i=1:length(dirContents)
%   images{i} = imread(fullfile(dirContents(i).folder,dirContents(i).name));
% end
% % create the video writer with 30 fps
% writerObj = VideoWriter(oN);
% writerObj.FrameRate = 30;
% % open the video writer
% open(writerObj);
% % write the frames to the video
% for u=1:length(dirContents)
%   % convert the image to a frame
%   frame = im2frame(images{u});
%   for v=1:length(dirContents)
%     writeVideo(writerObj, frame);
%   end
% end
% % close the writer object
% close(writerObj);
% %implay(oN);

return
