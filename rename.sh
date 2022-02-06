#!/bin/zsh
WALLPAPERS="./wallpapers"

# Get main color from image
function getcolor {
    echo $(convert $1 +dither -resize 64x64 -colors 5 -define histogram:unique-colors=true -format "%c" histogram:info: | head -n 1 | grep -o '#......')
}


# for each image in wallpapers
for IMG in `find $WALLPAPERS -name \*.jpg -or -name \*.png -or -name \*.jpeg`
do
    SIZE=$(identify -format '%wx%h' $IMG)
    NAME=$(echo $IMG:t:r | sed -e 's/@.*//g')
    EXT=$IMG:t:e
    COLOR=$(getcolor $IMG)

    mv $IMG $WALLPAPERS/$NAME@$COLOR@$SIZE.$EXT
    
done
