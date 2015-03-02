title: Submitting a Job to the UMass Cluster
tags: cluster, HPCC, GHPCC, python, LSF
author: Chris MacKay
date: 2015-03-01

------

First you will need to login to the cluster [see the past post](#) on how to do that.

Then you will need to decide the details about your jon:

|                                         | flag   |   example          |
|-----------------------------------------|--------|--------------------|
| how long will the job run for (hh:mm)   | `-W`   | `-W 04:00`         |
| which queue will you submit to          | `-q`   | `-q long`          |
| how many cores will you request         | `-n`   | `-n 20`            |
| what is the title of this job           | `-J`   | `-J important-job` |
| project name                            | `-P`   | `-P project-name`  |
| output file                             | `-oo`  | `-oo output.txt`   |



each one of these flags need to be in a separate, special comment that starts with `#BSUB` (capitalization is required)

```python 

#!/usr/bin/env python 

#BSUB -W 00:10
#BSUB -q regular
#BSUB -n 12
#BSUB -J myjob.py
#BSUB -P project_code
#BSUB -oo output
 
import subprocess

bowtie2 = "bowtie2"

genome = "lambda_virus"

raw = "/example/reads/reads_1.fq"

output = "eg1.sam"

bowtie_call = [bowtie2, "-x", genome, "-U", raw, "-S", output]

subprocess.call(bowtie_call) 
 
```

In order for this to work, you need to make sure that the your python submit script is *exectuable*. Making a file exectuable, means that the computer current user has been granted permission to run that perticular file directly (ie you can run it by name via `$ myscript.py`, as opposed to by first calling python via `$ python myscript.py`.

To make your python script exectubable use the `chmod` (aka **ch**ange **mod**e command): `chmod u+x myscript.py`. 

Then you can submit your job like so:

```bash

$ bjobs < pythonscript.py

```

example adapted from the from a NCAR/UCAR CISL [example](https://www2.cisl.ucar.edu/resources/yellowstone/using_resources/runningjobs/lsf_examples)

