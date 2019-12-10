#!/bin/bash

rm ./index.html ./index.pdf

pandoc ./index.markdown -f markdown -t html -s -o ./index.html --css pandoc.css

wkhtmltopdf ./index.html ./index.pdf > /dev/null
