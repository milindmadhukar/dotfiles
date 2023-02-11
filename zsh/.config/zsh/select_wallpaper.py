import subprocess
import os
import json
import pyautogui

os.chdir("/home/milind/wallpapers/")

image = subprocess.run(
    'find "/home/milind/wallpapers" -iname \'*.png\' -type f | fzf --preview "(kitty icat --place 60x60@66x7 --transfer-mode file {} )"',
    shell=True,
    stdout=subprocess.PIPE,
)

image = image.stdout.decode("utf-8").split("/")[-1].strip()
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

#  HACK: Find some other way to refresh config
pyautogui.press("f5")
print(f"Changed background to {image}")

subprocess.run("clear", shell=True)
