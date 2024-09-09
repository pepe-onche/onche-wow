#!/bin/bash

for file in OriginalStickers/*.png; do 
    if [ -f "$file" ]; then 
        x=${file%.*}
        convert "$file" -thumbnail '128x128>' -background transparent -gravity center -extent 128x128 -auto-orient -depth 8 -define tga:compression=none "Stickers/${x##*/}.tga"
    fi 
done

for file in OriginalStickers/*.jpeg; do 
    if [ -f "$file" ]; then 
        x=${file%.*}
        convert "$file" -thumbnail '128x128>' -background transparent -gravity center -extent 128x128 -auto-orient -depth 8 -define tga:compression=none "Stickers/${x##*/}.tga"
    fi 
done

for file in OriginalStickers/*.jpg; do 
    if [ -f "$file" ]; then 
        x=${file%.*}
        convert "$file" -thumbnail '128x128>' -background transparent -gravity center -extent 128x128 -auto-orient -depth 8 -define tga:compression=none "Stickers/${x##*/}.tga"
    fi 
done
