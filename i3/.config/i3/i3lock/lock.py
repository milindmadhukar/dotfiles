#!/usr/bin/env python

from PIL import Image, ImageFilter, ImageStat, ImageOps
import os

os.system("flameshot full -r > /tmp/screen.png")

im = Image.open("/tmp/screen.png")

# Convert to grayscale
grayscale = im.convert("L")
# Calculate mean
stat = ImageStat.Stat(im)
is_bright = stat.mean[0] > 127

im = im.filter(ImageFilter.GaussianBlur(radius=5))

lock = Image.open("/home/milind/.config/i3/i3lock/grx.png")

if is_bright:
    r,g,b,a = lock.split()
    rgb_lock = Image.merge('RGB', (r,g,b))
 
    inverted_image = ImageOps.invert(rgb_lock)
 
    r2, g2, b2 = inverted_image.split()
 
    lock = Image.merge('RGBA', (r2, g2, b2, a))

im.paste(
    lock,
    (im.size[0] // 2 - lock.size[0] // 2, im.size[1] // 2 - lock.size[1] // 2),
    lock,
)

im.save("/tmp/screen_blur.png")

os.system("i3lock -i /tmp/screen_blur.png")
os.system("rm /tmp/screen.png")
os.system("rm /tmp/screen_blur.png")

# TODO: Use xautolock to maybe do after inacativity?
