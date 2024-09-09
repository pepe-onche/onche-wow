#!/bin/bash

for file in Stickers/*.tga; do 
    if [ -f "$file" ]; then 
        x=${file%.*}
        echo "[\"${x##*/}\"] = true,"
    fi 
done
