#!/bin/bash

cd "$(dirname $0)"

DOCUMENTTITLE="Dr. Kliment Olechnovič - Curriculum Vitae"

################################################################################

{
cat ./Kliment_Olechnovic_CV.markdown | egrep '^## Introduction$' -B 999999 | head -n -1
cat ./Kliment_Olechnovic_CV.markdown | egrep '^## General information$' -A 999999
} > ./Kliment_Olechnovic_CV_for_pdf.markdown

########################################

rm -f ./Kliment_Olechnovic_CV.html
rm -f ./Kliment_Olechnovic_CV.pdf

pandoc ./Kliment_Olechnovic_CV_for_pdf.markdown --css pandoc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./Kliment_Olechnovic_CV.html
wkhtmltopdf --enable-local-file-access -L 12mm -R 12mm -T 12mm -B 12mm ./Kliment_Olechnovic_CV.html ./Kliment_Olechnovic_CV.pdf > /dev/null

########################################

rm -f ./Kliment_Olechnovic_CV_compact.html
rm -f ./Kliment_Olechnovic_CV_compact.pdf

cat ./Kliment_Olechnovic_CV_for_pdf.markdown | sed 's/  $//' > ./Kliment_Olechnovic_CV_compact.markdown
pandoc ./Kliment_Olechnovic_CV_compact.markdown --css pandoc_compact.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./Kliment_Olechnovic_CV_compact.html
wkhtmltopdf --enable-local-file-access -L 12mm -R 12mm -T 12mm -B 12mm ./Kliment_Olechnovic_CV_compact.html ./Kliment_Olechnovic_CV_compact.pdf > /dev/null

rm ./Kliment_Olechnovic_CV_compact.markdown
rm ./Kliment_Olechnovic_CV_compact.html

########################################

rm ./Kliment_Olechnovic_CV_for_pdf.markdown

################################################################################

rm -f ./Kliment_Olechnovic_CV_lt.html
rm -f ./Kliment_Olechnovic_CV_lt.pdf

pandoc ./Kliment_Olechnovic_CV_lt.markdown --css pandoc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./Kliment_Olechnovic_CV_lt.html
wkhtmltopdf --enable-local-file-access -L 12mm -R 12mm -T 12mm -B 12mm ./Kliment_Olechnovic_CV_lt.html ./Kliment_Olechnovic_CV_lt.pdf > /dev/null

################################################################################

rm -f ./index.html

pandoc ./Kliment_Olechnovic_CV.markdown --css pandoc_with_toc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./index.html

################################################################################

rm -f ./index_lt.html

pandoc ./Kliment_Olechnovic_CV_lt.markdown --css pandoc_with_toc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./index_lt.html

################################################################################

