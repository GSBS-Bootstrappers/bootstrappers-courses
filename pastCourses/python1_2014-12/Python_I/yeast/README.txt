--------------------------------
Definition and supported options
--------------------------------

The GTF (General Transfer Format) is an extension of GFF version 2 
and used to represent transcription models. GFF (General Feature Format) 
consists of one line per feature, each containing 9 columns of data. 

Fields

Fields are tab-separated. Also, all but the final field in each 
feature line must contain a value; "empty" columns are denoted 
with a '.'

    seqname   - name of the chromosome or scaffold; chromosome names 
                without a 'chr' 
    source    - name of the program that generated this feature, or 
                the data source (database or project name)
    feature   - feature type name. Current allowed features are
                {gene, transcript, exon, CDS, Selenocysteine, start_codon,
                stop_codon and UTR}
    start     - start position of the feature, with sequence numbering 
                starting at 1.
    end       - end position of the feature, with sequence numbering 
                starting at 1.
    score     - a floating point value indiciating the score of a feature
    strand    - defined as + (forward) or - (reverse).
    frame     - one of '0', '1' or '2'. Frame indicates the number of base pairs
                before you encounter a full codon. '0' indicates the feature 
                begins with a whole codon. '1' indicates there is an extra
                base (the 3rd base of the prior codon) at the start of this feature.
                '2' indicates there are two extra bases (2nd and 3rd base of the 
                prior exon) before the first codon. All values are given with
                relation to the 5' end.
    attribute - a semicolon-separated list of tag-value pairs (separated by a space), 
                providing additional information about each feature. A key can be
                repeated multiple times.

Attributes

The following attributes are available. All attributes are semi-colon
separated pairs of keys and values.

- gene_id: The stable identifier for the gene
- gene_version: The stable identifier version for the gene
- gene_name: The official symbol of this gene
- gene_source: The annotation source for this gene
- gene_biotype: The biotype of this gene
- transcript_id: The stable identifier for this transcript
- transcript_version: The stable identifier version for this transcript
- transcript_name: The symbold for this transcript derived from the gene name
- transcript_source: The annotation source for this transcript
- transcript_biotype: The biotype for this transcript
- exon_id: The stable identifier for this exon
- exon_version: The stable identifier version for this exon
- exon_number: Position of this exon in the transcript
- ccds_id: CCDS identifier linked to this transcript
- protein_id: Stable identifier for this transcript's protein
- protein_version: Stable identifier version for this transcript's protein
- tag: A collection of additional key value tags

Tags

Tags are additional flags used to indicate attibutes of the transcript.

- CCDS: Flags this transcript as one linked to a CCDS record
- seleno: Flags this transcript has a Selenocysteine edit. Look for the Selenocysteine
feature for the position of this on the genome
- cds_end_NF: the coding region end could not be confirmed
- cds_start_NF: the coding region start could not be confirmed
- mRNA_end_NF: the mRNA end could not be confirmed
- mRNA_start_NF: the mRNA start could not be confirmed.

Comments

Lines may be commented out by the addition of a single # character at the start. These
lines should be ignored by your parser.

Pragmas/Metadata

GTF files can contain meta-data. In the case of experimental meta-data these are 
noted by a #!. Those which are stable are noted by a ##. Meta data is a single key,
a space and then the value. Current meta data keys are:

* genome-build -  Build identifier of the assembly e.g. GRCh37.p11
* genome-version - Version of this assembly e.g. GRCh37
* genome-date - The date of this assembly's release e.g. 2009-02
* genome-build-accession - The accession and source of this accession e.g. NCBI:GCA_000001405.14
* genebuild-last-updated - The date of the last genebuild update e.g. 2013-09

------------------
Example GTF output
------------------

#!genome-build GRCh38
11      ensembl_havana  gene    5422111 5423206 .       +       .       gene_id "ENSG00000167360"; gene_version "4"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding";
11      ensembl_havana  transcript      5422111 5423206 .       +       .       gene_id "ENSG00000167360"; gene_version "4"; transcript_id "ENST00000300778"; transcript_version "4"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "OR51Q1-001"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS31381";
11      ensembl_havana  exon    5422111 5423206 .       +       .       gene_id "ENSG00000167360"; gene_version "4"; transcript_id "ENST00000300778"; transcript_version "4"; exon_number "1"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "OR51Q1-001"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS31381"; exon_id "ENSE00001276439"; exon_version "4";
11      ensembl_havana  CDS     5422201 5423151 .       +       0       gene_id "ENSG00000167360"; gene_version "4"; transcript_id "ENST00000300778"; transcript_version "4"; exon_number "1"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "OR51Q1-001"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS31381"; protein_id "ENSP00000300778"; protein_version "4";
11      ensembl_havana  start_codon     5422201 5422203 .       +       0       gene_id "ENSG00000167360"; gene_version "4"; transcript_id "ENST00000300778"; transcript_version "4"; exon_number "1"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "OR51Q1-001"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS31381";
11      ensembl_havana  stop_codon      5423152 5423154 .       +       0       gene_id "ENSG00000167360"; gene_version "4"; transcript_id "ENST00000300778"; transcript_version "4"; exon_number "1"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "OR51Q1-001"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS31381";
11      ensembl_havana  UTR     5422111 5422200 .       +       .       gene_id "ENSG00000167360"; gene_version "4"; transcript_id "ENST00000300778"; transcript_version "4"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "OR51Q1-001"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS31381";
11      ensembl_havana  UTR     5423155 5423206 .       +       .       gene_id "ENSG00000167360"; gene_version "4"; transcript_id "ENST00000300778"; transcript_version "4"; gene_name "OR51Q1"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "OR51Q1-001"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS31381";

