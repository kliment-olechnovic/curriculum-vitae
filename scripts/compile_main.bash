#!/bin/bash

function cleanup
{
	rm -f main.aux main.bbl main.blg main.log main.out main.fff main.lof main.lot main.ttt main.toc main.idx
}

cleanup

rm -f main.pdf main.bib

pdflatex -halt-on-error main
pdflatex -halt-on-error main
pdflatex -halt-on-error main

cleanup
