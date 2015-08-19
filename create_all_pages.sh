#!/bin/bash

wd=$(pwd)
for x in $(find . -name create_pages.sh);do
	cd $(dirname $x) && ./create_pages.sh && cd $wd
done;
