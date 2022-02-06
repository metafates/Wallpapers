#!/bin/zsh

OUTPUTDIR="./compressed"
WALLPAPERS="./wallpapers"

for IMG_PATH in $WALLPAPERS/*
do
    IMG=$IMG_PATH:t
    if [[ -f "$OUTPUTDIR/$IMG" ]]
    then
        continue
    fi
    
    EXT=$IMG:t:e
    if [[ $EXT = "jpg" ]]
    then
        jpegoptim -m1 $IMG_PATH -qsod $OUTPUTDIR
    elif [[ $EXT = "png" ]]
    then
        pngquant --force --speed 11 --strip $IMG_PATH -o $OUTPUTDIR/$IMG 
    fi
done
