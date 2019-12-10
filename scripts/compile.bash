#!/bin/bash

rm ./index.html

pandoc ./index.markdown -f markdown -t html -s -o ./index.html --css pandoc.css

