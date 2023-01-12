#!/bin/bash

# sample.md - documentation in Markdown format
# rendering - localtion of the reference template file

# merge Markdown using the reference template and create an output file
pandoc -f markdown -t odt sample.md --data-dir=rendering/ -o output.odt
 
# convert the output file to docx
libreoffice --invisible --convert-to docx --outdir output output.odt

# convert the output file to pdf
libreoffice --invisible --convert-to pdf --outdir output output.odt
