function gatherData(raterStr)
%% run_codeFrames('FACE')
%% run_codeFrames('HAND')
%% run_codeFrames('OBJECT')


dir('
dwd = 'rawData/video_to_frames/test';
list_fN = dir(fullfile(dwd,'*.jpg'));

rootOutDir = 'data'; mkdir(rootOutDir)
outDir = fullfile(rootOutDir,stimStr); mkdir(outDir)
list_done = dir(fullfile(outDir,[stimStr,'*.txt']))

close all
for f = length(list_done) + 1 : length(list_fN)
  h = gcf; % figure('position',[100,100,500,500]);
  h = imshow(fullfile(list_fN(f).folder,list_fN(f).name));
  
  fprintf('\nImage #: %d\nFileName: %s\nFACE? (1=TRUE, 0=FALSE)\n',f,list_fN(f).name)
  resp = getkey;
  if resp == 48
    resp = 0;
  elseif resp == 49
    resp = 1;
  else
    error('WRONG KEY PRESSED - Restart function (it will restart with this image)')
  end
  
  outN = fullfile(outDir,[stimStr,num2str(f),'.txt']);
  fileID = fopen(outN,'w');
  fmt = '%d';
  fprintf(fileID,fmt, resp);
  fclose(fileID);
  fprintf('Written response: %d to file: %s\n',resp,outN)
end