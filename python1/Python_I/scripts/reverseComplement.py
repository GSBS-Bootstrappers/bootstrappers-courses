#!/usr/bin/env python

# Example that shows how to use the 'ucscgenome' module from a script
# as well as how to write a simple function that produces the reverse
# complement of a sequence.

import ucscgenome
import string

def reverseComplement(sequence):
    # translate DNA sequences (both upper case and lower case) into rev. compl.
    t = string.maketrans("ACGTacgt", "TGCAtgca") # this creates a 'translate string' `t`
    return sequence.translate(t)[::-1]
    
def main():
    # main() - the main function
    myGenome = ucscgenome.Genome("saCcer3")
    mySequence = myGenome["chrIV"]
    print(mySequence[100:110])
    print(reverseComplement(mySequence[100:110]))
    
if __name__ == "__main__":
    main()
    
