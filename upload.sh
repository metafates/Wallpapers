#!/bin/zsh

echo "Compressing images"
./compress.sh

echo "Pushing to GitHub"
git add wallpapers/* 
git add compressed/*
git commit -m "[BOT] New Wallpaper Added" --quiet
git push origin main --quiet
echo "Images uploaded"
