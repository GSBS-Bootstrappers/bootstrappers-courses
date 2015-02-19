#!/usr/bin/env python
from itertools import groupby
import argparse

def fasta_iter(fasta_name):
    """
    from https://www.biostars.org/p/710/
    given a fasta file. yield tuples of header, sequence
    """
    fh = open(fasta_name)
    # ditch the boolean (x[0]) and just keep the header or sequence since
    # we know they alternate.
    faiter = (x[1] for x in groupby(fh, lambda line: line[0] == ">"))
    for header in faiter:
        # drop the ">"
        header = header.next()[1:].strip()
        # join all sequence lines to one.
        seq = "".join(s.strip() for s in faiter.next())
        yield header, seq
        

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-fasta', type=str, required = True, help = "Fasta Filename, first seq is genomic, rest are introns to be spliced out")
    return parser.parse_args()


def main():
    args = parse_args()
    for fasta_record in fasta_iter(args.fasta):
        print fasta_record[0] #name
        print fasta_record[1] #sequence

main()