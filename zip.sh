#!/bin/bash
cd ..
zip -r Onche.zip Onche -i '*.toc' '*.tga' '*.xml' '*.lua' 
mv Onche.zip Onche/Onche.zip
cd Onche || exit
