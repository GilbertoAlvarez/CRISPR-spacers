from Bio import Entrez
def singleEntry(singleID):   #the singleID is the accession number
    handle = Entrez.efetch(db='nucleotide',id=singleID, rettype = 'fasta', retmode= 'text')
    f = open('%s.fasta' % singleID, 'w')
    f.write(handle.read())
    handle.close()
    f.close()


    

import pandas as pd
df=pd.read_excel(r'/home/gabz/MTuber/evy153_Supp/Table_S1_List_of_strains.xlsx')
print df

