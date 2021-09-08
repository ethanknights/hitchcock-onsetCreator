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







done_readSave = 0;


for rater = 1:length(list_raterStr)
  
  raterStr = list_raterStr{rater};
  
  for i = 1:length(list_eventStr)
    
    eventStr = list_eventStr{i};
    
    dwd = fullfile(rootDir,raterStr,eventStr);
    dirContents = dir(fullfile(dwd,'*.txt'));
    if length({dirContents.name}) ~= 11972
      warning('wrong number of frame files, cutting those after 11972. Probly happens as doing 5 at a time, and doesnt restart at 5)');
    end
    
    %% read files and save as vector <data/events/data/JL_onlyFace.mat>
    outDir = fullfile(rootDir,'data'); if ~exist(outDir); mkdir(outDir); end
    oN = fullfile(outDir,[raterStr,'_',eventStr,'.mat']);
    
    if ~done_readSave
      parfor ii = 1:11972 %length(dirContents)
        fN = fullfile(dirContents(ii).folder,dirContents(ii).name);
        
        fileID = fopen(fN,'r');
        tmpD(ii) = fread(fileID);
        fclose(fileID);
      end
      
      tmpD(tmpD == 48) = false;
      tmpD(tmpD == 49) = true;
      frames = logical(tmpD);
      
      save(oN,'frames');
    end
    
    %% make events.tsv
    load(oN,'frames');
    
    allFrames(i,:) = frames;
    
  end

%   boolPlot(double(allFrames))
%   
%   %% boolPlot
% %   clear tmpD
% %   tmpD = double(allFrames');
% %   time = 0:length(allFrames)-1;
% %   hPlot = boolPlot(tmpD,time)
%       
      
end
