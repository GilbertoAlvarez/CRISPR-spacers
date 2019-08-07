
import pandas as pd
import scipy
import numpy as np
from Bio import Entrez

#function for reading files
def read_blast_output(output):
    return pd.read_csv(output,sep="\t", names=["qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore"])

#output from blast 
#Bacteria
ofm6="/home/gilberto/Documents/MTuber/Bac_20_Spacers.hits"
bofm=read_blast_output(ofm6)
#Viruses
#Human


Entrez.email='gilbert19p@gmail.com'
for i in range(1,len(bofm.sseqid)):
    print(bofm.sseqid[i])
    handle = Entrez.efetch(db="nucleotide", id=bofm.sseqid[i], rettype="gb", retmode="text")
    result=handle.read().split('\n')
    for line in result:
        if 'ORGANISM' in line:
            print(' '.join(line.split()[1:]))
