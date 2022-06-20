 
 #sed 's/,/\t/g' ../methyl_output_chr/BloodiPD_VS_BloodC_allchr_results.csv | awk ' BEGIN { first = 2; last = 5 } { for (i = first; i < last; i++) { printf("%s ", $i) } print $last,$7 }' | sed 's/"//g'|sed 's/ /\t/g' | sed 's/seqnames/#seqnames/g' > BloodiPD_VS_BloodC.bed #module load gcc/8.1.0 pcre2/10.35 R/4.0.3
 #module load gcc/8.1.0 pcre2/10.35 R/4.0.3
library(ChIPpeakAnno)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(EnsDb.Hsapiens.v75)
library(org.Hs.eg.db)
#annoData <- toGRanges(EnsDb.Hsapiens.v75, feature="gene")
load('/slgpfs/projects/idib57/data/genome/human_genome/EnsDb.Hsapiens.v75.RData')

library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(EnsDb.Hsapiens.v86)
annoData <- toGRanges(EnsDb.Hsapiens.v86, feature="gene")
load('/slgpfs/projects/idib57/data/genome/human_genome/EnsDb.Hsapiens.v86.RData')


bed <- dir(pattern=".bed")

# # hyperBloodiPD_VS_BloodC <- toGRanges("hypermeth_BloodiPD_VS_BloodC.bed", format="BED", header=FALSE)
# # hyperDAnC_VS_BloodC <- toGRanges("hypermeth_DAnC_VS_BloodC.bed", format="BED", header=FALSE)
# # # hyperDAniPD_VS_DAnC <- toGRanges("hypermeth_DAniPD_VS_DAnC.bed", format="BED", header=FALSE)
# hyperDAnL2PD_VS_DAnC <- toGRanges("hypermeth_DAnL2PD_VS_DAnC.bed", format="BED", header=FALSE)
# # hyperDAnL2PD_VS_DAniPD <- toGRanges("hypermeth_DAnL2PD_VS_DAniPD.bed", format="BED", header=FALSE)
# hyperDAnPD_VS_BloodiPD <- toGRanges("hypermeth_DAnPD_VS_BloodiPD.bed", format="BED", header=FALSE)
# # hyperDAnPD_VS_DAnC <- toGRanges("hypermeth_DAnPD_VS_DAnC.bed", format="BED", header=FALSE)
# # hyperDAn_VS_blood <- toGRanges("hypermeth_DAn_VS_blood.bed", format="BED", header=FALSE)
# hypoBloodiPD_VS_BloodC <- toGRanges("hypometh_BloodiPD_VS_BloodC.bed", format="BED", header=T)
# # hypoDAnC_VS_BloodC <- toGRanges("hypometh_DAnC_VS_BloodC.bed", format="BED", header=FALSE)
# # hypoDAniPD_VS_DAnC <- toGRanges("hypometh_DAniPD_VS_DAnC.bed", format="BED", header=FALSE)
# # hypoDAnL2PD_VS_DAnC <- toGRanges("hypometh_DAnL2PD_VS_DAnC.bed", format="BED", header=FALSE)
# # hypoDAnL2PD_VS_DAniPD <- toGRanges("hypometh_DAnL2PD_VS_DAniPD.bed", format="BED", header=FALSE)
# # hypoDAnPD_VS_BloodiPD <- toGRanges("hypometh_DAnPD_VS_BloodiPD.bed", format="BED", header=FALSE)
# # hypoDAnPD_VS_DAnC <- toGRanges("hypometh_DAnPD_VS_DAnC.bed", format="BED", header=FALSE)
# # hypoDAn_VS_blood <- toGRanges("hypometh_DAn_VS_blood.bed", format="BED", header=FALSE)

BloodiPD_VS_BloodC <- toGRanges("BloodiPD_VS_BloodC.bed.bed", format="BED", header=FALSE)
DAn_VS_Blood       <- toGRanges("DAn_VS_Blood.bed.bed", format="BED", header=FALSE)     
DAnC_VS_BloodC     <- toGRanges("DAnC_VS_BloodC.bed.bed", format="BED", header=FALSE)   
DAniPD_VS_DAnC     <- toGRanges("DAniPD_VS_DAnC.bed.bed", format="BED", header=FALSE)   
DAnL2PD_VS_DAnC    <- toGRanges("DAnL2PD_VS_DAnC.bed.bed", format="BED", header=FALSE)  
DAnL2PD_VS_DAniPD  <- toGRanges("DAnL2PD_VS_DAniPD.bed.bed", format="BED", header=FALSE)
DAnPD_VS_BloodiPD  <- toGRanges("DAnPD_VS_BloodiPD.bed.bed", format="BED", header=FALSE)
DAnPD_VS_DAnC      <- toGRanges("DAnPD_VS_DAnC.bed.bed", format="BED", header=FALSE)


KO52_DMSO1=toGRanges("1.bed", format="BED", header=FALSE)
KO52_DMSO2=toGRanges("2.bed", format="BED", header=FALSE)
KO52_MON1=toGRanges("3.bed", format="BED", header=FALSE)
KO52_MON2=toGRanges("4.bed", format="BED", header=FALSE)



BloodiPD_VS_BloodC      <- toGRanges("BloodiPD_VS_BloodC_comp.bed.coord.bed", format="BED", header=FALSE)
DAniPD_VS_DAnC      <- toGRanges("DAniPD_VS_DAnC_comp.bed.coord.bed", format="BED", header=FALSE)
DAnL2PD_VS_DAnC     <- toGRanges("DAnL2PD_VS_DAnC_comp.bed.coord.bed", format="BED", header=FALSE)
DAnL2PD_VS_DAniPD      <- toGRanges("DAnL2PD_VS_DAniPD_comp.bed.coord.bed", format="BED", header=FALSE)
DAnPD_VS_DAnC    <- toGRanges("DAnPD_VS_DAnC_comp.bed.coord.bed", format="BED", header=FALSE)


peaks <- GRangesList(BloodiPD_VS_BloodC=BloodiPD_VS_BloodC,
DAniPD_VS_DAnC=DAniPD_VS_DAnC,
DAnL2PD_VS_DAnC=DAnL2PD_VS_DAnC,
DAnL2PD_VS_DAniPD=DAnL2PD_VS_DAniPD,
DAnPD_VS_DAnC=DAnPD_VS_DAnC)


svg("peaks_binOverFeature.svg")
binOverFeature(peaks,annotationData=annoData,
               radius=5000, nbins=100, FUN=length, errFun=0,
                xlab="distance from TSS (bp)", ylab="count", 
               main="Distribution of aggregated peak numbers around TSS")
dev.off()




# peaks <- GRangesList(rep1=gr1,rep2=gr2)
svg("peaks_genomicElementDistribution.svg")
genomicElementDistribution(peaks, 
                           TxDb = TxDb.Hsapiens.UCSC.hg19.knownGene,
                           promoterRegion=c(upstream=2000, downstream=500),
                           geneDownstream=c(upstream=0, downstream=2000),
                           promoterLevel=list(
                         # from 5' -> 3', fixed precedence 3' -> 5'
                             breaks = c(-2000, -1000, -500, 0, 500),
                             labels = c("upstream 1-2Kb", "upstream 0.5-1Kb", 
                                        "upstream <500b", "TSS - 500b"),
                             colors = c("#FFE5CC", "#FFCA99", 
                                        "#FFAD65", "#FF8E32")))

dev.off()




peaks <- GRangesList(BloodiPD_VS_BloodC=BloodiPD_VS_BloodC,
DAn_VS_blood      =DAn_VS_Blood,     
DAnC_VS_BloodC    =DAnC_VS_BloodC,   
DAniPD_VS_DAnC    =DAniPD_VS_DAnC,   
DAnL2PD_VS_DAnC   =DAnL2PD_VS_DAnC,  
DAnL2PD_VS_DAniPD =DAnL2PD_VS_DAniPD,
DAnPD_VS_BloodiPD =DAnPD_VS_BloodiPD,
DAnPD_VS_DAnC     =DAnPD_VS_DAnC)

svg("genomicElementDistribution.svg")
genomicElementDistribution(peaks, 
                           TxDb = TxDb.Hsapiens.UCSC.hg38.knownGene,
                           promoterRegion=c(upstream=10000, downstream=10000),
                           geneDownstream=c(upstream=0, downstream=2000))
dev.off()

for (i in 1:length(names(peaks)))
{
svg(paste(names(peaks)[i],".gED.svg",sep=""))
out <- genomicElementDistribution(peaks[i], 
                           TxDb = TxDb.Hsapiens.UCSC.hg38.knownGene,
                           promoterRegion=c(upstream=10000, downstream=500),
                           geneDownstream=c(upstream=10000, downstream=10000),
                           promoterLevel=list(
                         # from 5' -> 3', fixed precedence 3' -> 5'
                             breaks = c(-2000, -1000, -500, 0, 500),
                             labels = c("upstream 1-2Kb", "upstream 0.5-1Kb", 
                                        "upstream <500b", "TSS - 500b"),
                             colors = c("#FFE5CC", "#FFCA99", 
                                        "#FFAD65", "#FF8E32")))
dev.off()

#overlaps.anno <- annotatePeakInBatch(unlist(peaks[i]) , 
   #                                  AnnotationData=annoData, 
       #                              output="nearestBiDirectionalPromoters",
           #                          bindingRegion=c(-10000, 10000))

#write.table(data.frame(overlaps.anno),file=paste(names(peaks)[i],".txt",sep=""),sep="\t",quote=F, row.names =F)
write.table(data.frame(out$peaks),file=paste(names(peaks)[i],"genomicElementDist.txt",sep=""),sep="\t",quote=F, row.names =F)

}
                                        




overlaps.anno <- annotatePeakInBatch(KO52_DMSO1, 
                                     AnnotationData=annoData, 
                                     output="nearestBiDirectionalPromoters",
                                     bindingRegion=c(-2000, 500))


overlaps.anno <- addGeneIDs(overlaps.anno,
                            "org.Hs.eg.db",
                            IDs2Add = "entrez_id")



svg("peaks_EnrichedGO.svg")
over <- getEnrichedGO(peaks, orgAnn="org.Hs.eg.db", condense=TRUE)
enrichmentPlot(over)
dev.off()


