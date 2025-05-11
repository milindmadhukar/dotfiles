# !/usr/bin/python3

import os
import random
import pyautogui
import json

os.chdir("/home/milind/wallpapers/")

def get_images():
    base_path = os.getcwd()
    images = []
    for root, dirs, files in os.walk(base_path):
        for file in files:
            if file.endswith(".png"):
                images.append(os.path.join("/".join(root.split("/")[4:]), file))
    
    return images

image = random.choice(get_images())
path = os.path.join(os.getcwd(), image)
os.system(f"kitty @ set-background-image {path}")

tint = 0

with open("tints.json", "r") as f:
    tints = json.load(f)
    tint = tints.get(image, 0.83)
with open("/home/milind/.config/kitty/background.conf", "w") as f:
    f.write(
        f"background_image {path}\nbackground_tint {tint}\n"
        "background_image_layout scaled"
    )

#  HACK: Some other way to refresh config
pyautogui.press("f5")
print(f"Changed background to {image}")
