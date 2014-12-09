#!/usr/bin/env bash

# download annotations
rm -f Saccharomyces_cerevisiae.R64-1-1.78.gtf.gz
wget 'ftp://ftp.ensembl.org/pub/release-78/gtf/saccharomyces_cerevisiae/Saccharomyces_cerevisiae.R64-1-1.78.gtf.gz'

# extract transcripts
gunzip -c Saccharomyces_cerevisiae.R64-1-1.78.gtf.gz | awk -F"\t" '$2 == "ensembl" && $3 == "transcript"' | \
	cut -f1,4,5,6,7,9 | sed 's|gene_id.*transcript_id "||; s|"\;.*$||' | \
	sort -k1,1 -k2n,3n | sed 's|Mito|M|' | \
	awk '{ print "chr"$1"\t"$2"\t"$3"\t"$6"\t"$4"\t"$5 }' > Saccharomyces_cerevisiae.R64-1-1.78_transcripts.bed

# shuffled regions
bedtools shuffle -g sacCer3.genome -i Saccharomyces_cerevisiae.R64-1-1.78_transcripts.bed | \
	sort -k1,1 -k2n,3n | \
	awk 'BEGIN {q=0} { printf $1"\t"$2"\t"$3"\tR%04d\t"$5"\t"$6"\n", q; q=q+1 }' > Saccharomyces_cerevisiae.R64-1-1.78_random.bed
