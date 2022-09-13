import PIL
import os
import os.path
from PIL import Image

f = r'/rama3'
for file in os.listdir(f):
    f_img = f+"/"+file
    img = Image.open(f_img)
    img = img.resize((2048,1024))
    img.save(f_img)
