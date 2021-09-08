%% Purpose: Create Event Onset Files
%%
%% Output Table (data/rater-<Initials>/events_stimulus-<stimString>.csv): 
%% Event, Time (s), Dur (s)
%% Face, 22, 34
%% Face, 45, 4

function createEvents(raterStr,stimStr,nFramesToWrite)
%% ========================================================================
%% In/Out Paths
%% ========================================================================
rootOutDir = 'data'; if~exist(rootOutDir,'dir'); mkdir(rootOutDir); end
outDir = fullfile(rootOutDir,['rater-',raterStr],['nFrames-',num2str(nFramesToWrite)]); mkdir(outDir);

rawD = load(...
  fullfile('../02_program_manualRating/data/',...
  [raterStr],stimStr,['nFrames-',num2str(nFramesToWrite)],'frames.mat')); rawD=rawD.frames;
d = rawD;

%% ========================================================================
%% Visualise
%% ========================================================================
%close all; figure; plot(rawD(1,:)); ylim([-1 2]); title(['Rater-',raterStr,' ','Stimulus-',stimStr])
%export fig?


%% ========================================================================
%% Convert to secs
%% ========================================================================
samples_vector = 1:length(d);           % Sample Indices Vector
samples_frequency = 25;                 % Sampling Frequency (Hz)
tim = samples_vector/samples_frequency; % Time Vector (seconds)

%% ========================================================================
%% Create onsets file
%% ========================================================================
timDiff = unique(round(diff(tim),2)); %0.4 secs between frames, for durations

%% get event idx's
idx = find(d); 
idx(2,:) = [0,diff(idx)]; %every single event & nFrames difference between events (0 diff for first event!)
idx2 = [idx(1,1), idx(1,idx(2,:) > 1) ];  % List first event & all other nonconsec events


for i = 1:length(idx2)
  
  currIdx = idx2(i);

  out.eventStart(i) = tim(currIdx); %seconds
  
  %% calc duration
  tmpIdx = find( idx(1,:) == currIdx );
  
  if idx(2,tmpIdx + 1) == 1 %if next event has 1 frame difference, then event has consec events (i.e. longer duration)
    
    %% set tmpD3 to the nConsecFrames
    tmpD = idx(:,tmpIdx+1:end); %trim idx to all events AFTER given event
    
    if i ~= length(idx2);  %if not final event, find first nonconsec event
      tmpD2 = find(tmpD(2,:) > 1);
      tmpD3 = tmpD2(1);
    else                  %go to end (as no nonconsec event exists after final event!)
      tmpD3 = size(tmpD,2);
    end
    
    out.durations(i) = tmpD3 * timDiff; %seconds (the consec nFrames)
  
  else %just 1 frame diff
    out.durations(i) = timDiff; 
  end
  
   out.endSecs(i) = out.eventStart(i) + out.durations(i);
end

%% Store in table 
t = [out.eventStart;out.durations;out.endSecs]';
for i = 2:length(t)-1
  t(i,4) = round( t(i+1,1) - t(i,3) , 2);
end

t = array2table(t);
t.Properties.VariableNames = {'onsetSecs','durationSecs','endSecs','diffFromLastEventSecs'}

writetable(t,fullfile(outDir,['events_stimulus-',stimStr,'.csv']))