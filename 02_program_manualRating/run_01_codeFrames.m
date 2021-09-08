function run_01_codeFrames(raterStr,stimStr,nFramesToWrite)

dwd = '../01_convertMovieToFrames/data';
list_fN = dir(fullfile(dwd,'*.jpg'));

rootOutDir = 'data'; mkdir(rootOutDir)
outDir = fullfile(rootOutDir,raterStr,stimStr,['nFrames-',num2str(nFramesToWrite)]); mkdir(outDir)
list_done = dir(fullfile(outDir,[stimStr,'*.txt']))

close all
figure('position',[50,50,0,0]);
for f = length(list_done) + 1 : nFramesToWrite : length(list_fN)
  h = gcf;
  h = imshow(fullfile(list_fN(f).folder,list_fN(f).name));
  
  fprintf('\nImage #: %d\nFileName: %s\n%s? (1=TRUE, 0=FALSE)\n',f,list_fN(f).name,stimStr)
  resp = getKey;
  if resp == 48
    resp = 0;
  elseif resp == 49
    resp = 1;
  else
    error('WRONG KEY PRESSED - Restart function (it will restart with this image)')
  end
  
  for frame = 1:nFramesToWrite
    outN = fullfile(outDir,[stimStr,num2str( (f-1) + frame),'.txt']);
    fileID = fopen(outN,'w');
    fmt = '%d';
    fprintf(fileID,fmt, resp);
    fclose(fileID);
    fprintf('Written response: %d to file: %s\n',resp,outN)
  end
end