#!/bin/bash

# sample.md - documentation in Markdown format
# rendering/reference.docx - reference template file

# merge Markdown using the reference template and create an output file (Microsoft Word)
pandoc -f markdown -t docx sample.md --reference-doc=rendering/reference.docx -o output/sample.docx

# convert the Microsoft Word document to PDF and place it in the output folder
libreoffice --invisible --convert-to pdf --outdir output output/sample.docx