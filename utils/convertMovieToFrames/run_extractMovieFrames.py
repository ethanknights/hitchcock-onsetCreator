import cv2
import time
import os

os.chdir('/Users/ethanknights/imaging/projects/hitchcock_movie/utils/convertMovieToFrames')
fN_movie = '/Users/ethanknights/ownCloud/share/Cam-CAN/movieStimuli_Hitchcock/bangbangyouredead_v2 corrected.mov'

from extractMovieFrames import video_to_frames
video_to_frames(fN_movie, 'test')