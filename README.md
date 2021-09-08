# Create Event Onsets from Cam-CAN Hitcock Movie

<h2> Prerequisities </h2>
- Python: cv module </br>
- Cam-CAN hitchcock stimulus: bangbangyouredead_v2 corrected.mov </br> </br>

<h1> 1. Convert Movie To Frames </h1>

```bash
cd utils/convertMovieToFrames
python run_extractMovieFrames.py
```

<h1> 2. Manual Rating  </h1>


Next, use matlab to have a manual rater perform coding (i.e. code frames for particular stimuli). Do this, for example, 5 frames a time using this function:

```c
run_codeFrames_vQuick5frames('EK','onlyFACE')
```

Arguments correspond to (1) rater's initials and (2) the term being coded (i.e. true when onlyFaces are present). </br> 
Images appear, and you must press 1 for true, 0 for false. </br>
The script will pick up from the last image rated. To make an edit, go to the output text files: