#!/bin/bash
for x in `find . -name *.Rmd`; do ../../bin/rmdToHtml.R $x; done
