#!/bin/bash

rm ./index.html ./index.pdf

pandoc ./index.markdown --css pandoc.css -f markdown -t html -s -o ./index.html

wkhtmltopdf ./index.html ./Kliment_Olechnovic_CV.pdf > /dev/null
