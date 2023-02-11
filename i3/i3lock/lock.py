#!/usr/bin/env python

from PIL import Image, ImageFilter
import os

os.system("flameshot full -r > /tmp/screen.png")

im = Image.open("/tmp/screen.png")
im = im.filter(ImageFilter.GaussianBlur(radius=5))

lock = Image.open("/home/milind/.config/i3/i3lock/grx.png")
im.paste(
    lock,
    (im.size[0] // 2 - lock.size[0] // 2, im.size[1] // 2 - lock.size[1] // 2),
    lock,
)

im.save("/tmp/screen_blur.png")

os.system("i3lock -i /tmp/screen_blur.png")
os.system("rm /tmp/screen_blur.png")
