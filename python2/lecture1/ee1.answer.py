#!/usr/bin/env python

import os, errno
import urllib

def mkdir_p(path):
    # from http://stackoverflow.com/a/600612
    try:
        os.makedirs(path)
    except OSError as exc: # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else: raise

class Paths():
    def __init__(self, lectureNumber):
        self.homeFolder = os.path.abspath(os.path.expanduser("~"))
        self.python2folder = os.path.join(self.homeFolder, "python_2")
        lecture = "lecture_" + str(lectureNumber)
        self.lectureFolder = os.path.join(self.python2folder, lecture)
        print "today's lecture folder location will be:", self.lectureFolder
        mkdir_p(self.lectureFolder)

paths = Paths(1)

class ChipseqData:
    def __init__(self, paths, url):
        pass

url = "http://bib3.umassmed.edu/~purcarom/Python2/Lecture1/ENCFF002COQ.narrowPeak"
fileName = os.path.basename(url)
fnp = os.path.join(paths.lectureFolder, fileName)
print "going to download", fileName, "from", url

urllib.URLopener().retrieve(url, fnp)

# narrowPeak format info: http://genome.ucsc.edu/FAQ/FAQformat.html#format12

counter = 0
with open(fnp) as f:
    for line in f:
        if line.startswith("chr7"):
            counter += 1

print counter
