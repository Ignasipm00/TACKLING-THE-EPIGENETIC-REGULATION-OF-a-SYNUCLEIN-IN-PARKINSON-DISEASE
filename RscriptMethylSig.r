library(methylKit)
library(methylSig)
setwd("methyl_output_chr/chr1/")
files <- dir(pattern=".bedGraph") 


# read the files to a methylRawList object: myobj

#row.names = gsub("_extract_CpG.bedGraph","",files)
#colData = data.frame(row.names),
bsseq_stranded = bsseq::read.bismark(
    files = files,
    colData = data.frame(row.names = c('SP-01-3w','SP-02-3w','SP-04-3w','SP-05-3w','SP-06-3w','SP-08-3w','SP-09-3w','SP-10-3w','SP-11-3w','SP-12-3w','SP-13-3w','SP-15-3w','SP-16-3w','SP-17-3w','DNA_1','DNA_2','DNA_3','DNA_4','DNA_5','DNA_6','DNA_7','DNA_8','DNA_9','DNA_10','DNA_11','DNA_12','DNA_13','DNA_14','DNA_15','DNA_16','DNA_17','DNA_18','DNA_19','DNA_20')),    
    rmZeroCov = FALSE,
    strandCollapse = FALSE #because methylation data comes from MethylDackel which already destrands the data.
)

GenomicRanges::granges(bsseq_stranded)

windowed_bs = tile_by_windows(bs = bsseq_stranded, win_size = 10000)

GenomicRanges::granges(windowed_bs)

bsseq::pData(bsseq_stranded)


#getMethylationStats(bsseq_stranded[[2]],plot=FALSE)
#getMethylationStats(bsseq_stranded[[2]],plot=TRUE)

save.image('sig.RData')