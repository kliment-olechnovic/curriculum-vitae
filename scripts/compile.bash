#!/bin/bash

rm ./index.html ./Kliment_Olechnovic_CV.pdf

pandoc ./Kliment_Olechnovic_CV.markdown --css pandoc.css -f markdown -t html -s -o ./index.html

wkhtmltopdf -L 10mm -R 10mm -T 10mm -B 10mm ./index.html ./Kliment_Olechnovic_CV.pdf > /dev/null
