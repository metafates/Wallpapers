#!/bin/zsh

echo "Compressing images"
./compress.sh

echo "Pushing to GitHub"
git rm -r --cached wallpapers
git rm -r --cached compressed
git add wallpapers/* 
git add compressed/*
git commit -am "[BOT] Wallpapers Updated" --quiet
git push origin main --quiet
echo "Images uploaded"
