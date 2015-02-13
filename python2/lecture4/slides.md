% title: Bootstrappers: <br/>Python 2, Session 4
% subtitle: February 12, 2015
% author: Chris MacKay
% author: and Mike Purcaro & the GSBS Bootstrappers
% thankyou: Thanks everyone!
% contact: <span>website </span> <a href="http://bioinfo.umassmed.edu/bootstrappers/">http://bioinfo.umassmed.edu/bootstrappers/</a>
% contact: <span>github</span> <a href="http://github.com/crmackay">crmackay</a>
% favicon: 

---
title: Outline
build_lists: false


- Rosalind Problems:
    - more on classes and methods
    - more on using python from the terminal
    - briefly go over module and package basics [Link](https://docs.python.org/2/tutorial/modules.html)
    - using basic command line arguments [Link](http://www.tutorialspoint.com/python/python_command_line_arguments.htm)

---
title: Rosalind Problems: 


<pre>
- DNA Counting DNA Nucleotides
- RNA Transcribing DNA into RNA
- REVC Complementing a Strand of DNA
- GC Computing GC Content
- HAMM Counting Point Mutations
- PROT Translating RNA into Protein
- SPLC RNA Splicing
- SUBS Finding a Motif in DNA
- PRTM Calculating Protein Mass
- REVP Locating Restriction Sites
</pre>
---

title: Problem 1: <a href="http://rosalind.info/problems/dna/">DNA</a>

- *Given:* A DNA string s of length at most 1000 nt.

- *Return:* Four integers (separated by spaces) counting the respective 
number of times that the symbols 'A', 'C', 'G', and 'T' occur in s.

**Try this:**

- solve the problem with a `DNASequence` class, with a method that returns a 
count of all bases
- what if your DNA sequence has `"N"`s?


---

title: Problem 2: <a href="http://rosalind.info/problems/rna/">RNA</a>

- *Given:* A DNA string *t* having length at most 1000 nt.

- *Return:* The transcribed RNA string of *t*.

**Try this:**

- how about adding a new method to your `DNASequence` class that returns an RNA
version of the DNA sequence?

---

title: Problem 3: <a href="http://rosalind.info/problems/revc/">REVC</a>

- *Given:* A DNA string $s$ of length at most 1000 bp.

- *Return:* The reverse complement $s^{c}$ of $s$.

**Try this:**

- how about adding a new method to your `DNASequence` class?

---

title: Sorting a list (pg 1)...<a href="https://docs.python.org/2/library/functions.html#sorted">(sorted(list))</a>

`sorted(list)` creates a new list and leaves the old list intact
<pre class="prettyprint" data-lang="python">
my_list = [67, 81, 24, 100]
test = sorted(my_list)
print test  # [24, 67, 81, 100]
test = sorted(my_list, reverse = True)
print test # [100, 81, 67, 24] 

def getKey(item):    # to sort the list by last digit only
    item = str(item)
    return int(item[-1])
test = sorted(my_list, key = getKey)
print test # [100, 81, 24, 67]

test = sorted(my_list, key = lambda x: int(str(x)[-1]))
print test # [100, 81, 24, 67] 

</pre>

  
---

title: Sorting a list (pg 2)...(<a href="https://docs.python.org/2/howto/sorting.html">list.sort()</a>)

`list.sort()` sorts the list in place (*NO NEW LIST MADE*)
<pre class="prettyprint" data-lang="python">
my_list = [67, 81, 24, 100]
my_list.sort()
print my_list # [24, 67, 81, 100]
my_list.sort(reverse = True)
print my_list # [100, 81, 67, 24]

def getKey(item):
    item = str(item)
    return int(item[-1])
my_list.sort(key = getKey)
print my_list # [100, 81, 24, 67]

my_list.sort(key = lambda x: int(str(x)[-1]))
print my_list # [100, 81, 24, 67]

</pre>

---
title: Problem 4: <a href="http://rosalind.info/problems/gc/">GC</a>

- *Given:* At most 10 DNA strings in FASTA format (of length at most 1 kbp 
each).

- *Return:* The ID of the string having the highest GC-content, 
followed by the GC-content of that string on the next line.

**Try this:**

- try creating a `FASTAFile` class with a method that returns a `DNASequence` 
object for each sequence in the file
- how about adding a new method to your `DNASequence` class that calculates
the GC content?
---
title: Problem 5: <a href="http://rosalind.info/problems/hamm/">HAMM</a>

- *Given:* Two DNA strings $s$ and $t$ of equal length (not exceeding 1 kbp).

- *Return:* The Hamming distance $d_{H}(s,t)$.

**Try this:**

- add another method to your `DNASequence` class


---
title: Problem 6: <a href="http://rosalind.info/problems/prot/">PROT</a>

- *Given:* An RNA string $s$ corresponding to a strand of mRNA 
(of length at most 10 kbp).

- *Return:* The protein string encoded by $s$. of that string on the next line.

- **HELP**:
    [codon table](resources/codon_table.txt)

---
title: Problem 7: <a href="http://rosalind.info/problems/SPLC/">SPLC</a>

- *Given:* A DNA string $s$ (of length at most 1 kbp) and a collection 
of substrings of $s$ acting as introns. All strings are given in FASTA format.

- *Return:* A protein string resulting from transcribing and 
translating the exons of $s$. 
(Note: Only one solution will exist for the dataset provided.)

**Try this:**

- use your `FASTAFile` class
- how about adding a new method to your `DNASequence` class that calculates
the GC content?

---
title: Adding default attributes to class and keyword arguments

<pre class="prettyprint" data-lang="python">

class Gene(DNASequence):
    def __init__(self, sequence, id, introns = None)
        DNASequence.__init__(self, sequence, id):
        self.introns = introns
        
    def spliced(self):
        ...
        return spliced_sequence

new_sequence = DNASequence('ATCGCTAGAGCT', 'seq_12345')

next_sequence = DNASequence(id = 'seq_35452', 
                            sequence = 'TGCTAGCTGAATCA', 
                            introns = [seq_obj1, seq_ob2, seq_ob3])
</pre>


---

title: Problem 8: <a href="http://rosalind.info/problems/SUBS/">SUBS</a>

- *Given:* Two DNA strings $s$ and $t$ (each of length at most 1 kbp).

- *Return:* All locations of $t$ as a substring of $s$.

**NOTE:**

- python uses 0-based counting, but is that what *Rosalind* is looking for?

---
title: Problem 9: <a href="http://rosalind.info/problems/PRTM/">PRTM</a>

- *Given:* A protein string $P$ of length at most 1000 aa.

- *Return:* The total weight of $P$. Consult the [monoisotopic mass table](resources/monoisotopic.txt).

**Try This:**

- try creating a protein class, and a calculate mass method.
---

title: tangent on Modules...

say you have a function called `reverseComplement` in a `myCode.py` file 
which is in the same directory as this script:
<pre class="prettyprint" data-lang="python">
import myCode
new_rev_comp = myCode.reverseComplement(sequence)
</pre>
<pre class="prettyprint" data-lang="python">
import myCode as my
new_rev_comp = my.reverseComplement(sequence)
</pre>
<pre class="prettyprint" data-lang="python">
from myCode import reverseComplement
new_rev_comp = reverseComplement(sequence)
</pre>
<pre class="prettyprint" data-lang="python">
from myCode import reverseComplement as rc
new_rev_comp = rc(sequence)
</pre>


to read more on modules and packages go [here](https://docs.python.org/2/tutorial/modules.html)
---

title: Problem 10: <a href="http://rosalind.info/problems/REVP/">REVP</a>

- *Given:* Given: A DNA string of length at most 1 kbp in FASTA format.

- *Return:* The position and length of every reverse palindrome in the 
string having length between 4 and 12. You may return these pairs in 
any order.

<pre>
4 6
5 4
6 6 ...
</pre>

**Try this:**

- try to call in some of your previously written classes and functions 
from another `.py` file...

---

title: Intro slide
build_lists: true

Here is a list that should build:

- I like formulas, like this one $e=mc^2$
- It's rendered using MathJax. You can change the settings by editing base.html if you like
- pressing 'f' toggle fullscreen
- pressing 'w' toggles widescreen
- 'o' toggles overview mode

---
</pre>

