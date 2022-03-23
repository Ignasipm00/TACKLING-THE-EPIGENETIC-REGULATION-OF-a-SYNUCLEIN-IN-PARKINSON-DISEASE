#module load gcc/8.1.0 pcre2/10.35 R/4.0.3

load('hg19annot.RData') # alternative(which works) to getAnnot("hg19")
#setwd('methyl_output_chr/')

library(bsseq)
library(dmrseq)
library("BiocParallel")
register(MulticoreParam(4)) #to parallelize using 24 cores

factor <- read.table('Group.Comparison.txt',sep = '\t',header=TRUE)#,na.strings=c(""," ","NA"))

setwd('methyl_output_chr/')
file <- dir('chr12',full.names = T,pattern='.bedGraph') 
#file <- dir(pattern='.bedGraph')
 
#setwd('chr…/')
bs <- read.bismark(files=file, rmZeroCov=TRUE, strandCollapse=FALSE, verbose=TRUE, nThread=20)

setwd('chr12_results/')
#1.DAn_VS_blood

#gsub(".*/","",gsub("-.*","",gsub("_.*","",file)))#condition to be added i.e. male/female, age, control/test, blood/brain...
pData(bs)$Condition <- factor[,8] #from 7 to 15 
pData(bs)$DAnPD_VS_DAnC <- factor[,9] #from 7 to 15 
pData(bs)$DAniPD_VS_DAnC <- factor[,10] #from 7 to 15 
pData(bs)$DAnL2PD_VS_DAnC <- factor[,11] #from 7 to 15 
pData(bs)$DAnL2PD_VS_DAniPD <- factor[,12] #from 7 to 15 
pData(bs)$BloodiPD_VS_BloodC <- factor[,13] #from 7 to 15 
pData(bs)$DAnPD_VS_BloodiPD <- factor[,14] #from 7 to 15 
pData(bs)$DAnC_VS_BloodC <- factor[,15] #from 7 to 15 

#loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
#bs.filtered <- bs[loci.idx,]
#
#regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="Condition") #, cutoff=0.05, 
#show(regions)
#
#sigRegions <- regions[regions$qval < 0.05,]
#write.csv(as.data.frame(sigRegions), file = "DAn_VS_blood_chr12_sigregions.csv") #export a csv file containing the significant regions only
#
#sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation
# 
#svg('DAn_VS_blood_chr12_plotDMRregion.svg')
#plotDMRs(bs.filtered, regions=regions[1,], testCovariate="Condition",
#    annoTrack=annoTrack)
#dev.off()
#
#svg('DAn_VS_blood_chr12_plotEmpiricalDistributionM.svg')
#plotEmpiricalDistribution(bs.filtered, testCovariate="Condition")
#dev.off()
#
#svg('DAn_VS_blood_chr12_plotEmpiricalDistributionCov.svg')
#plotEmpiricalDistribution(bs.filtered, testCovariate="Condition", type="Cov")
#dev.off()
#
#write.csv(as.data.frame(regions), file="DAn_VS_blood_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#2.DAnPD_VS_DAnC

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="DAnPD_VS_DAnC") #, cutoff=0.05,  
show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = "DAnPD_VS_DAnC_chr12_sigregions.csv") #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation

svg('DAnPD_VS_DAnC_chr12_plotDMRregion.svg')
plotDMRs(bs.filtered, regions=regions[1,], testCovariate="DAnPD_VS_DAnC",
    annoTrack=annoTrack)
dev.off()

svg('DAnPD_VS_DAnC_chr12_plotEmpiricalDistributionM.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnPD_VS_DAnC")
dev.off()

svg('DAnPD_VS_DAnC_chr12_plotEmpiricalDistributionCov.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnPD_VS_DAnC", type="Cov")
dev.off()

write.csv(as.data.frame(regions), file="DAnPD_VS_DAnC_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#3.DAniPD_VS_DAnC

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="DAniPD_VS_DAnC") #, cutoff=0.05,  
show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = "DAniPD_VS_DAnC_chr12_sigregions.csv") #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation

svg('DAniPD_VS_DAnC_chr12_plotDMRregion.svg')
plotDMRs(bs.filtered, regions=regions[1,], testCovariate="DAniPD_VS_DAnC",
    annoTrack=annoTrack)
dev.off()

svg('DAniPD_VS_DAnC_chr12_plotEmpiricalDistributionM.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAniPD_VS_DAnC")
dev.off()

svg('DAniPD_VS_DAnC_chr12_plotEmpiricalDistributionCov.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAniPD_VS_DAnC", type="Cov")
dev.off()

write.csv(as.data.frame(regions), file="DAniPD_VS_DAnC_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#4.DAnL2PD_VS_DAnC

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="DAnL2PD_VS_DAnC") #, cutoff=0.05, , 
show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = "DAnL2PD_VS_DAnC_chr12_sigregions.csv") #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation

svg('DAnL2PD_VS_DAnC_chr12_plotDMRregion.svg')
plotDMRs(bs.filtered, regions=regions[1,], testCovariate="DAnL2PD_VS_DAnC",
    annoTrack=annoTrack)
dev.off()

svg('DAnL2PD_VS_DAnC_chr12_plotEmpiricalDistributionM.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnL2PD_VS_DAnC")
dev.off()

svg('DAnL2PD_VS_DAnC_chr12_plotEmpiricalDistributionCov.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnL2PD_VS_DAnC", type="Cov")
dev.off()

write.csv(as.data.frame(regions), file="DAnL2PD_VS_DAnC_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#5.DAnL2PD_VS_DAniPD

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="DAnL2PD_VS_DAniPD") #, cutoff=0.05, , 
show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = "DAnL2PD_VS_DAniPD_chr12_sigregions.csv") #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation

svg('DAnL2PD_VS_DAniPD_chr12_plotDMRregion.svg')
plotDMRs(bs.filtered, regions=regions[1,], testCovariate="DAnL2PD_VS_DAniPD",
    annoTrack=annoTrack)
dev.off()

svg('DAnL2PD_VS_DAniPD_chr12_plotEmpiricalDistributionM.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnL2PD_VS_DAniPD")
dev.off()

svg('DAnL2PD_VS_DAniPD_chr12_plotEmpiricalDistributionCov.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnL2PD_VS_DAniPD", type="Cov")
dev.off()

write.csv(as.data.frame(regions), file="DAnL2PD_VS_DAniPD_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#6.BloodiPD_VS_BloodC

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="BloodiPD_VS_BloodC") #, cutoff=0.05,  
show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = "BloodiPD_VS_BloodC_chr12_sigregions.csv") #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation

svg('BloodiPD_VS_BloodC_chr12_plotDMRregion.svg')
plotDMRs(bs.filtered, regions=regions[1,], testCovariate="BloodiPD_VS_BloodC",
    annoTrack=annoTrack)
dev.off()

svg('BloodiPD_VS_BloodC_chr12_plotEmpiricalDistributionM.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="BloodiPD_VS_BloodC")
dev.off()

svg('BloodiPD_VS_BloodC_chr12_plotEmpiricalDistributionCov.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="BloodiPD_VS_BloodC", type="Cov")
dev.off()

write.csv(as.data.frame(regions), file="BloodiPD_VS_BloodC_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#7.DAnPD_VS_BloodiPD

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="DAnPD_VS_BloodiPD") #, cutoff=0.05, 
show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = "DAnPD_VS_BloodiPD_chr12_sigregions.csv") #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation

svg('DAnPD_VS_BloodiPD_chr12_plotDMRregion.svg')
plotDMRs(bs.filtered, regions=regions[1,], testCovariate="DAnPD_VS_BloodiPD",
    annoTrack=annoTrack)
dev.off()

svg('DAnPD_VS_BloodiPD_chr12_plotEmpiricalDistributionM.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnPD_VS_BloodiPD")
dev.off()

svg('DAnPD_VS_BloodiPD_chr12_plotEmpiricalDistributionCov.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnPD_VS_BloodiPD", type="Cov")
dev.off()

write.csv(as.data.frame(regions), file="DAnPD_VS_BloodiPD_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#8.DAnC_VS_BloodC

loci.idx <- which(DelayedMatrixStats::rowSums2(getCoverage(bs, type="Cov")==0) == 0) # to eliminate regions with no coverage
bs.filtered <- bs[loci.idx,]

regions <- dmrseq(bs=bs.filtered ,cutoff=0.05,testCovariate="DAnC_VS_BloodC") #, cutoff=0.05, 
show(regions)

sigRegions <- regions[regions$qval < 0.05,]
write.csv(as.data.frame(sigRegions), file = "DAnC_VS_BloodC_chr12_sigregions.csv") #export a csv file containing the significant regions only

sum((sigRegions$stat > 0) / length(sigRegions)) #proportion of regions with hyper-methylation

svg('DAnC_VS_BloodC_chr12_plotDMRregion.svg')
plotDMRs(bs.filtered, regions=regions[1,], testCovariate="DAnC_VS_BloodC",
    annoTrack=annoTrack)
dev.off()

svg('DAnC_VS_BloodC_chr12_plotEmpiricalDistributionM.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnC_VS_BloodC")
dev.off()

svg('DAnC_VS_BloodC_chr12_plotEmpiricalDistributionCov.svg')
plotEmpiricalDistribution(bs.filtered, testCovariate="DAnC_VS_BloodC", type="Cov")
dev.off()

write.csv(as.data.frame(regions), file="DAnC_VS_BloodC_chr12_results.csv") #'/slgpfs/projects/idib57/GA_001_21_Parkinson/methyl_output_chr/', 

#setwd('./..')
save.image("results_chr12.RData")
#testCovariate <- "what to analyse"

#regions <- dmrseq(bs=bs['begin':'end',],
#                  cutoff = 0.05,
#                  testCovariate=testCovariate)

#annoTrack <- getAnnot("hg19") #---> localHub=FALSE ¡¡error!!




