#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Illegal number of parameters, need 1 argument, 1)filename"
    exit
fi


/usr/bin/python /usr/bin/ipython nbconvert $1
