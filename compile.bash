#!/bin/bash

cd "$(dirname $0)"

DOCUMENTTITLE="Dr. Kliment Olechnovič - Curriculum Vitae"

rm ./Kliment_Olechnovic_CV.html ./Kliment_Olechnovic_CV.pdf
pandoc ./Kliment_Olechnovic_CV.markdown --css pandoc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./Kliment_Olechnovic_CV.html
wkhtmltopdf --enable-local-file-access -L 12mm -R 12mm -T 12mm -B 12mm ./Kliment_Olechnovic_CV.html ./Kliment_Olechnovic_CV.pdf > /dev/null

rm ./Kliment_Olechnovic_CV_lt.html ./Kliment_Olechnovic_CV_lt.pdf
pandoc ./Kliment_Olechnovic_CV_lt.markdown --css pandoc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./Kliment_Olechnovic_CV_lt.html
wkhtmltopdf --enable-local-file-access -L 12mm -R 12mm -T 12mm -B 12mm ./Kliment_Olechnovic_CV_lt.html ./Kliment_Olechnovic_CV_lt.pdf > /dev/null

rm ./Kliment_Olechnovic_CV_compact.pdf
cat ./Kliment_Olechnovic_CV.markdown | sed 's/  $//' > ./Kliment_Olechnovic_CV_compact.markdown
pandoc ./Kliment_Olechnovic_CV_compact.markdown --css pandoc_compact.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s -o ./Kliment_Olechnovic_CV_compact.html
wkhtmltopdf --enable-local-file-access -L 12mm -R 12mm -T 12mm -B 12mm ./Kliment_Olechnovic_CV_compact.html ./Kliment_Olechnovic_CV_compact.pdf > /dev/null
rm ./Kliment_Olechnovic_CV_compact.markdown ./Kliment_Olechnovic_CV_compact.html

rm ./index.html
pandoc ./Kliment_Olechnovic_CV.markdown --css pandoc_with_toc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s --toc --toc-depth=2 -o ./index.html

rm ./index_lt.html
pandoc ./Kliment_Olechnovic_CV_lt.markdown --css pandoc_with_toc.css -f markdown -t html --metadata title="$DOCUMENTTITLE" --variable title="" -s --toc --toc-depth=2 -o ./index_lt.html

