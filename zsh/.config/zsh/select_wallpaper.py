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


image_path = "/".join(image.stdout.decode("utf-8").strip().split("/")[4:])
print(image_path)

base_path = "/home/milind/wallpapers/"

path = base_path + image_path   

os.system(f"kitty @ set-background-image {path}")

tint = 0

with open("tints.json", "r") as f:
    tints = json.load(f)
    tint = tints.get(image_path, 0.83)
    print(tint)
with open("/home/milind/.config/kitty/background.conf", "w") as f:
    f.write(
        f"background_image {image_path}\nbackground_tint {tint}\n"
        "background_image_layout scaled"
    )

#  HACK: Find some other way to refresh config
pyautogui.press("f5")
print(f"Changed background to {image}")

subprocess.run("clear", shell=True)
