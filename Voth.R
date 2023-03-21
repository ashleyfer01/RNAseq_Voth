#Voth Data Set 
#Import data reads 
library(tidyverse)
library(biomaRt)
library(annotables)
library(org.Hs.eg.db)
library(EnsDb.Hsapiens.v86)
library(tidyverse)
library(dplyr)
rawdata<-read.csv(file='vothsraw.csv', header = TRUE)
geneIDs<-read.delim(file='gene name.txt', header=TRUE)


# method 3: annotation DBs

keytypes(org.Hs.eg.db)
columns(org.Hs.eg.db)
annot<-select(org.Hs.eg.db, keys=rawdata$geneID, columns="SYMBOL", keytype = "ENSEMBL")
colnames(annot)<-c("geneID","SYMBOL")
resultTable<-merge(rawdata,annot, by="geneID")
annotate_list<-as.tibble(resultTable)
resul<-annotate_list
Newlist<-annotate_list%>%
  select('geneID', 'SYMBOL','WT.1','WT.2','WT.3','IcmD.1','IcmD.2','IcmD.3','Uninfected.1','Uninfected.2','Uninfected.3')

