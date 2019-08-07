  1 #!/bin/bash
  2 #SBATCH -A crocker                # group to which you belong
  3 #SBATCH -N 1                        # number of nodes
  4 #SBATCH -n 1                        # number of cores
  5 #SBATCH --mem 5G                  # memory pool for all cores
  6 #SBATCH -t 0-4:00                   # runtime limit (D-HH:MM:SS)
  7 #SBATCH -o slurm.%N.%j.out          # STDOUT
  8 #SBATCH -e slurm.%N.%j.err          # STDERR
  9 #SBATCH --mail-type=END,FAIL        # notifications for job done & fail
 10 #SBATCH --mail-user=gilberto.alvarez@embl.de # send-to address
 11 
 12 module load BLAST+
 13 blastn -db nt -query all20.fasta -entrez_query "Bacteria[Organism]" -remote     -outfmt 6 >Bac_20_Spacers.hits
