#!/bin/bash
for f in *.ipynb
do
	../../../bin/ipyToHtml.sh $f
done

