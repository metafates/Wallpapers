#!/bin/zsh

WALLPAPERS="./wallpapers"


# for each image in wallpapers
for IMG in `find $WALLPAPERS -name \*.jpg -or -name \*.png -or -name \*.jpeg`
do
    SIZE=$(identify -format '%wx%h' $IMG)
    NAME=$IMG:t:r
    EXT=$IMG:t:e
    
    # if name is not like dawfawg@1920x1080.png
    if [[ ! $NAME =~ .*@[0-9].*x[0-9].*$ ]]
    then
        # rename
        mv $IMG $WALLPAPERS/$NAME@$SIZE.$EXT
    fi
done
