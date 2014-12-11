#!/usr/bin/env python

import ucscgenome
import string

def reverseComplement(sequence):
    t = string.maketrans("ACGTacgt", "TGCAtgca") # this creates a 'translate string' `t`
    return sequence.translate(t)[::-1]
    
def main():
    myGenome = ucscgenome.Genome("saCcer3")
    mySequence = myGenome["chrIV"]
    print(mySequence[100:110])
    print(reverseComplement(mySequence[100:110]))
    
if __name__ == "__main__":
    main()
    
