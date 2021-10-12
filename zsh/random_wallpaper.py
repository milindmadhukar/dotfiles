# !/usr/bin/python3

import os
import random
import pyautogui
import json

os.chdir("/home/milind/wallpapers/")

image = random.choice([file for file in os.listdir() if file.endswith(".png")])
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
