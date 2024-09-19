#!/bin/bash

for file in OriginalSmileys/*.gif; do 
    if [ -f "$file" ]; then 
        # Get the width and height of the image
        width=$(identify -format "%w" "$file")
        height=$(identify -format "%h" "$file")

        # Determine the largest dimension
        max_dim=$((width > height ? width : height))

        # Find the next power of two
        next_pow2=1
        while [ $next_pow2 -lt $max_dim ]; do
            next_pow2=$((next_pow2 * 2))
        done

        x=${file%.*}
        convert "$file" -thumbnail "${next_pow2}x${next_pow2}" -background transparent -gravity center -extent "${next_pow2}x${next_pow2}" -auto-orient -depth 8 -define tga:compression=none "Smileys/${x##*/}.tga"
        echo "[\"\"] = \"${x##*/}.tga:$max_dim:$max_dim:0:0\","
    fi 
done

