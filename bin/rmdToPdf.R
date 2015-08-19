#!/usr/bin/env Rscript

args=commandArgs(TRUE)
#1)name of rmd

require(rmarkdown)

render(args[1], output_format = "pdf_document")
