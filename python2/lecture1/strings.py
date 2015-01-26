#!/usr/bin/env python

s = "Hello World!"
print s
s = "Hello World!\n"
print s

if 0:
    print s[0:5]
    s[0:4] = "HELLO!"
    print s

s = "HELLO!" + s[5:-1]
print s


s = "Hello World!"
print s.startswith("He")
print s.split()
print s.split("o")

s = "2015"
print s == 2015
print int(s) == 2015
print s == str(2015)
