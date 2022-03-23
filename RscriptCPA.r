library(ChIPpeakAnno)
setwd("methyl_output_chr/")

bed = 'filewithdata.bed'
gr1 <- toGRanges(bed, format="BED", header=FALSE) #save bedfile
gr2 <- toGRanges(gff, format="GFF", header=FALSE, skip=3) #save random here


save.image('methyl.RData')