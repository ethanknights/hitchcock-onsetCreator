# Create Event Onsets from Cam-CAN Hitcock Movie

<h2> Prerequisities </h2>
- Matlab </br>
- Python (including cv module) </br>
- Cam-CAN hitchcock stimulus: bangbangyouredead_v2 corrected.mov </br> </br>

<h1> 1. Convert Movie To Frames </h1>

```py
cd utils/convertMovieToFrames
python run_extractMovieFrames.py
```

<h1> 2. Manual Rating  </h1>


Next, use matlab to have a manual rater perform coding (i.e. code frames for particular stimuli) and create a movie of the collected frames using python. The routine is detailed here:
```c
cd 02_program_manualRating
run_00_wrapper
```

For example, the default settings will allow coding of 30 frames at time and deposit the output to a directory with my initials (e.g. can change to test reliability) for the given stimulus type (i.e. presence of faces):

```c
run_01_codeFrames('EK','Face',30)
```

Running this program causes images to appear, frame-by-frame (e.g. 30 at a time), and the rater presses 1 for true | 0 for false (i.e. true if the frame contains an attentionally salient face). </br>
To exit the program, press any other key. Upon restart, the program will pick up from the last rated image. To make an edit (e.g. triggerhappy mistakes), go to the output text files (e.g. data/EK/Face/nFrames-30/*nFrameToChange*.txt) and change the contents to 48 (false) or 49 (true).

After following the matlab routine in the wrapper file, there's an option to use Anaconda (i.e. with cv module imported) to write a movie of the collected frames with python:

```py
python run_03_writeMovie.py
#Produces: 02_program_manualRating/data/EK/Face/nFrames-30/stimMovie.avi
```


<h1> 3. Create Event Onsets File  </h1>
Finally use matlab to generate the events files. See the routine in:

```c
cd 03_createEventOnsets
run_wrapper_createEvents
```

Example output is provided here: </br> 
```sh
data/rater-EK/nFrames-30/events_stimulus-Face.csv
```
|onsetSecs|durationSecs|endSecs|diffFromLastEventSecs|
|---------|------------|-------|---------------------|
|4.84     |6           |10.84  |0                    |
|15.64    |1.2         |16.84  |2.4                  |
|19.24    |7.2         |26.44  |1.2                  |