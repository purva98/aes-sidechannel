#!/bin/bash

file="report"
totalfile="lisayz-skoppula-utsav-$file"

# Compile the tex file
pdflatex --shell-escape -jobname=$totalfile ${file}.tex
pdflatex --shell-escape -jobname=$totalfile ${file}.tex

# Cleanup the junk
rm -rf *.log *.aux missfont.log _minted* texput.log *.out *.dvi *.pyg

if [ "$(uname)" == "Darwin" ]; then
    open ${totalfile}.pdf &
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    evince ${totalfile}.pdf &
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo 'Windows not supported!'
fi
