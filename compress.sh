#!/bin/zsh

COMPRESSED="./compressed"
MEDIUM="./medium"
WALLPAPERS="./wallpapers"

for IMG_PATH in $WALLPAPERS/*
do
    IMG=$IMG_PATH:t
    if [[ -f "$COMPRESSED/$IMG" && -f "$MEDIUM/$IMG" ]]
    then
        continue
    fi
    
    EXT=$IMG:t:e
    if [[ $EXT = "jpg" ]]
    then
        jpegoptim -m1 $IMG_PATH -qsod $COMPRESSED
        convert -resize 1% $COMPRESSED/$IMG $COMPRESSED/$IMG
        
        jpegoptim -m30 $IMG_PATH -qsod $MEDIUM
        convert -resize 15% $MEDIUM/$IMG $MEDIUM/$IMG
    elif [[ $EXT = "png" ]]
    then
        pngquant --force --speed 11 --quality=0-1 --strip $IMG_PATH -o $COMPRESSED/$IMG 
        convert -resize 1% $COMPRESSED/$IMG $COMPRESSED/$IMG
        
        pngquant --force --speed 8 --strip $IMG_PATH -o $MEDIUM/$IMG
        convert -resize 15% $MEDIUM/$IMG $MEDIUM/$IMG
    fi
done

# Check if some images were removed from wallpapers
for IMG_PATH in $COMPRESSED/*
do
    IMG=$IMG_PATH:t
    # if not exists
    if [[ ! -a "$WALLPAPERS/$IMG" ]]
    then
        rm $IMG_PATH
        rm $MEDIUM/$IMG
    fi
done

