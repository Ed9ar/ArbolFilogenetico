###Proyecto final

#install.packages ("ape")
#install.packages ("phangorn")
#install.packages ("seqinr")

#Cargar librerías

library(ape) #Leer, escribir, trazar y manipular árboles filogenéticos
library(phangorn) #Métodos de estimación de árboles filogenéticos
library(seqinr) #Análisis de datos y visualización de datos de secuencias biológicas (ADN/proteínas)


coronavirusaln <- read.alignment("covid.fasta", format = 'fasta') #Lee secuencias de ADN y las devuelve en una matriz
#printMultipleAlignment(coronavirus, 60)
coronavirusdist <- dist.alignment(coronavirusaln) 

print(coronavirusdist)

coronavirus <- read.dna("covid.fasta", format = 'fasta') #Lee secuencias de ADN y las devuelve en una matriz
#printMultipleAlignment(coronavirus, 60)

coronavirus_phyDat <- phyDat(coronavirus, type = "DNA", levels = NULL) #Transforma el formato de ADN a phyDat

dna_dist <- dist.ml(coronavirus, model="JC69")
coronavirus_UPGMA <- upgma(dna_dist)
coronavirus_NJ  <- NJ(dna_dist)

print(parsimony(coronavirus_UPGMA, coronavirus_phyDat))
print(parsimony(coronavirus_NJ, coronavirus_phyDat))


pdf("treeplot.pdf") 
# 2. Create a plot
plot(coronavirus_UPGMA, main="UPGMA")
plot(coronavirus_NJ, "unrooted", main="NJ")

# Close the pdf file
dev.off() 

