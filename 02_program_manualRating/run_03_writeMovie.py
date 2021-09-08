import cv2
import numpy as np
import glob
import re
import os
 
img_array = []

files = glob.glob1('tmp', '*' + '.jpg')

# Sort files according to the digits included in the filename
files = sorted(files, key=lambda x:float(re.findall("(\d+)",x)[0]))

for f in files:
    img = cv2.imread(os.path.join('tmp',f))
    height, width, layers = img.shape
    size = (width,height)
    img_array.append(img)
 
out = cv2.VideoWriter('project.avi',cv2.VideoWriter_fourcc(*'DIVX'), 60, size)
 
for i in range(len(img_array)):
    out.write(img_array[i])
out.release()