#module load gcc/8.1.0 pcre2/10.35 R/4.0.3
args = commandArgs(TRUE)
chr <-  args[1]
i = 12

load('hg19annot.RData') # alternative(which works) to getAnnot("hg19")
#setwd('methyl_output_chr/')

library(bsseq)
library(dmrseq)
library("BiocParallel")
register(MulticoreParam(4)) #to parallelize using X cores

factor <- read.table('Group.Comparison.txt',sep = '\t',header=TRUE)#,na.strings=c(""," ","NA"))
factor <- factor[order(factor$files),]

setwd('methyl_output_chr/')
file <- dir(chr,full.names = T,pattern='.bedGraph') 
#file <- dir(pattern='.bedGraph')


#setwd('chr…/')
file=file[factor[,i]!=""]
factor <- factor[factor[,i]!="",]

bs <- read.bismark(files=file, rmZeroCov=TRUE, strandCollapse=FALSE, verbose=TRUE, nThread=20)

setwd(paste(chr,'results/',sep="_"))
#1.DAn_VS_blood



#gsub(".*/","",gsub("-.*","",gsub("_.*","",file)))#condition to be added i.e. male/female, age, control/test, blood/brain...

if (i == 9)
{
pData(bs)$DAn_VS_blood <- factor[,9] #from 7 to 15 
pheno="DAn_VS_blood"
}
if (i == 10)
{
pData(bs)$DAnPD_VS_DAnC <- factor[,10] #from 7 to 15 
pheno="DAnPD_VS_DAnC"
}
if (i == 11)
{
pData(bs)$DAniPD_VS_DAnC <- factor[,11] #from 7 to 15 
pheno="DAniPD_VS_DAnC"
}
if (i == 12)
{
pData(bs)$DAnL2PD_VS_DAnC <- factor[,12] #from 7 to 15 
pheno="DAnL2PD_VS_DAnC"
}
if (i == 13)
{
pData(bs)$DAnL2PD_VS_DAniPD <- factor[,13] #from 7 to 15 
pheno="DAnL2PD_VS_DAniPD"
}
if (i == 14)
{
pData(bs)$BloodiPD_VS_BloodC <- factor[,14] #from 7 to 15
pheno="BloodiPD_VS_BloodC"
}
if (i == 15)
{
pData(bs)$DAnPD_VS_BloodiPD <- factor[,15] #from 7 to 15 
pheno="DAnPD_VS_BloodiPD"
}
if (i == 16)
{
pData(bs)$DAnC_VS_BloodC <- factor[,16] #from 7 to 15 
pheno="DAnC_VS_BloodC"
}

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate=pheno) #, cutoff=0.05, 
write.csv(as.data.frame(regions), file=paste(pheno,chr,"results.csv",sep="_")) #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = paste(pheno,chr,"sigregions.csv",sep="_")) #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation
 
svg(paste(pheno,chr,'plotDMRregion.svg',sep="_"))
plotDMRs(bs.filtered, regions=regions[1,], testCovariate=pheno,
    annoTrack=annoTrack)
dev.off()

svg(paste(pheno,chr,'plotEmpiricalDistributionM.svg',sep="_"))
plotEmpiricalDistribution(bs.filtered, testCovariate=pheno)
dev.off()

svg(paste(pheno,chr,'plotEmpiricalDistributionCov.svg',sep="_"))
plotEmpiricalDistribution(bs.filtered, testCovariate=pheno, type="Cov")
dev.off()


save.image(paste(chr,'result.RData',sep="_"))

