#!/usr/bin/env python

def area(length, width):
    return length * width

def mean(numbers): # this defines a function `mean()`
    mysum = sum(numbers)
    return float(mysum) / len(numbers)

def hello():
    print("Hello World")

def main(): # this defines a function `main()`
    x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print(mean(x))
    print(type(mean(x)))
    myvariable = hello()
    print(type(myvariable))
    print(area(10, 15))

if __name__ == "__main__":
    main()
