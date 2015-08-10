#!/usr/bin/env python

import sys

print "1+2 = ", 1+2

print "1e100 + 2e100 = ", 1e100 + 2e100
print "1e400 + 2e400 = ", 1e400 + 2e400

print "1e-100 + 2e-100 = ", 1e-100 + 2e-100
print "1e-400 + 2e-400 = ", 1e-400 + 2e-400

print "1e100 * 2e100 = ", 1e100 * 2e100
print "1e400 * 2e400 = ", 1e400 * 2e400

print "1e-100 * 2e-100 = ", 1e-100 * 2e-100
print "1e-400 * 2e-400 = ", 1e-400 * 2e-400
print "1e-400 * 2e-400 == 2e-800? ", (1e-400 * 2e-400) == 2e-800
print "1e-400 * 2e-400 == 0? ", (1e-400 * 2e-400) == 0
print "1e-400 * 2e-400 > 0? ", (1e-400 * 2e-400) > 0

print sys.float_info

print "******************************* numpy"

import numpy

print "numpy.longdouble('1e100') + numpy.longdouble('2e100') = ", numpy.longdouble('1e100') + numpy.longdouble('2e100')
print "numpy.longdouble('1e400') + numpy.longdouble('2e400') = ", numpy.longdouble('1e400') + numpy.longdouble('2e400')

print "numpy.longdouble('1e-100') + numpy.longdouble('2e-100') = ", numpy.longdouble('1e-100') + numpy.longdouble('2e-100')
print "numpy.longdouble('1e-400') + numpy.longdouble('2e-400') = ", numpy.longdouble('1e-400') + numpy.longdouble('2e-400')

print "numpy.longdouble('1e100') * numpy.longdouble('2e100') = ", numpy.longdouble('1e100') * numpy.longdouble('2e100')
print "numpy.longdouble('1e400') * numpy.longdouble('2e400') = ", numpy.longdouble('1e400') * numpy.longdouble('2e400')

print "numpy.longdouble('1e-100') * numpy.longdouble('2e-100') = ", numpy.longdouble('1e-100') * numpy.longdouble('2e-100')
print "numpy.longdouble('1e-400') * numpy.longdouble('2e-400') = ", numpy.longdouble('1e-400') * numpy.longdouble('2e-400')
print "numpy.longdouble('1e-400') * numpy.longdouble('2e-400') == 2e-800? ", numpy.longdouble('1e-400') * numpy.longdouble('2e-400') == numpy.longdouble('2e-800')
print "numpy.longdouble('1e-400') * numpy.longdouble('2e-400') == 0? ", numpy.longdouble('1e-400') * numpy.longdouble('2e-400') == 0
print "numpy.longdouble('1e-400') * numpy.longdouble('2e-400') > 0? ", numpy.longdouble('1e-400') * numpy.longdouble('2e-400') > 0


print "******************************* gmpy"
import gmpy
from gmpy import mpf

print "mpf('1e100') + mpf('2e100') = ", mpf('1e100') + mpf('2e100')
print "mpf('1e400') + mpf('2e400') = ", mpf('1e400') + mpf('2e400')

print "mpf('1e-100') + mpf('2e-100') = ", mpf('1e-100') + mpf('2e-100')
print "mpf('1e-400') + mpf('2e-400') = ", mpf('1e-400') + mpf('2e-400')

print "mpf('1e100') * mpf('2e100') = ", mpf('1e100') * mpf('2e100')
print "mpf('1e400') * mpf('2e400') = ", mpf('1e400') * mpf('2e400')

print "mpf('1e-100') * mpf('2e-100') = ", mpf('1e-100') * mpf('2e-100')
print "mpf('1e-400') * mpf('2e-400') = ", mpf('1e-400') * mpf('2e-400')
print "mpf('1e-400') * mpf('2e-400') == 2.e-800? ", mpf('1e-400') * mpf('2e-400') == mpf('2.e-800')
print "mpf('1e-400') * mpf('2e-400') == 0? ", mpf('1e-400') * mpf('2e-400') == 0
print "mpf('1e-400') * mpf('2e-400') > 0? ", mpf('1e-400') * mpf('2e-400') > 0
