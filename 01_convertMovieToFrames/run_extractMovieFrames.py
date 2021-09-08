import cv2
import time
import os

fN_movie = '/Users/ethanknights/ownCloud/share/Cam-CAN/movieStimuli_Hitchcock/bangbangyouredead_v2 corrected.mov'
oN = 'data'
if not os.path.exists(oN):
    os.makedirs(oN)

from extractMovieFrames import video_to_frames
video_to_frames(fN_movie, oN)

#os.remove('__pycache__')