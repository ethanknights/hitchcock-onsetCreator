function gatherData(raterStr,eventStr)


  inDir = fullfile('data',raterStr,eventStr);
  
  outDir = fullfile('data','eventFiles'); if ~exist(outDir); mkdir(outDir); end
  oN = fullfile(outDir,[raterStr,eventStr,'.mat']);
  
  dirContents = dir(fullfile(inDir,'*.txt'))
  
  for fNum = 1:11972
    fileID = fopen(fullfile(dirContents(fNum).folder,dirContents(fNum).name),'r');
    frames(fNum) = fread(fileID);
    fclose(fileID);
  end

  
  frames = frames == 49; %TRUE
 
  save(oN,'frames');
  
end
