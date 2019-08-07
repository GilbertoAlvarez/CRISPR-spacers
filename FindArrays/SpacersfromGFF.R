library(dplyr)
library(tidyr)
#get spacers
#from the results of CRISPRFinder get the spacers from the GFF files  
FilesGFF<-list.files("/home/gilberto/Documents/MTuber/Results_20G/GFF/")
setwd("/home/gilberto/Documents/MTuber/Results_20G/GFF/")
#"/home/gilberto/Documents/UbuntuThings/MTuber/Results_20G/spacersSeq/"

#extract spacers from all genomes
#go by each genome and extract spacers and save them in a file
for (i in FilesGFF){
  seFile<-read.table(i)
  #v1 genome v2 tool v3 type of sequence, v4,v5 coordinates v7 sense v9 sequences and info
  #as.character(seFile$V9[seFile$V3=="CRISPRspacer"])
  #extract sequence and ID of each spacer for each genome
  ExSeqTxt<-lapply(strsplit(as.character(seFile$V9[seFile$V3=="CRISPRspacer"]),";"),'[[',1)
  IdSp<-lapply(strsplit(as.character(seFile$V9[seFile$V3=="CRISPRspacer"]),";"),'[[',2)
  rIdSp<-paste0(">",unlist(IdSp))
  ExSeq<-lapply(strsplit(unlist(ExSeqTxt),"="),'[[',2)
  rExSeq<-unlist(ExSeq)
  tabFas<-(cbind(rIdSp,rExSeq)) 
  Xfasta<-character(nrow(tabFas)*2)
  Xfasta[c(TRUE,FALSE)]<-tabFas[,1]
  Xfasta[c(FALSE,TRUE)]<-tabFas[,2]
  writeLines(Xfasta,paste0("/home/gilberto/Documents/MTuber/Results_20G/spacersSeq/",i,"fastaSpacers.fa"))
}

#write Queries for Blastn
