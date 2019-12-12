#!/bin/bash

rm ./index.html ./Kliment_Olechnovic_CV.pdf

pandoc ./Kliment_Olechnovic_CV.markdown --css pandoc.css -f markdown -t html -s -o ./index.html

wkhtmltopdf -L 12mm -R 12mm -T 12mm -B 12mm ./index.html ./Kliment_Olechnovic_CV.pdf > /dev/null
