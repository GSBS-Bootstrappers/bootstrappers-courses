#!/usr/bin/env python

v = []
for i in range(10):
    v.append(i)
print v

v = []
for i in range(10):
    v.insert(0, i)
print v

v = [1, 1, 2, 3, 5, 8, 13, 21]
print v.count(1)
print v[0]
print v[-1]
print v[-2]
print v[1:2]
print v[::-1]
print v.index(21)

print "*************"

v = v[3:5]
print v
v[0] = 100
print v
v[1] = [1,1,2]
print v
