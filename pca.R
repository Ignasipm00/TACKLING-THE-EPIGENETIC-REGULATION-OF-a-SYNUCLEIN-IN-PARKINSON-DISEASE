
#module load gcc/8.1.0 pcre2/10.35 R/4.0.3
args = commandArgs(TRUE)

std 	<- 	args[1]
samp	<- 	args[2]

std 	<- as.numeric(std)


library(RColorBrewer)

#  
#   sd=apply(m[,4:37],1,sd)
#   m=m[sd > std,]

#  save.image("image.R")
#  load("image.R")

mm=read.table('matrix.meth.txt',h=T)

row.names(mm)=paste(mm[,1],mm[,2],mm[,3],sep="_")
mm=mm[,-c(1:3)]

mm=mm[,order(colnames(mm))]

m=mm[,grep(samp,colnames(mm))]

sd=apply(m,1,sd)
m=m[sd > std,]
tm=t(m)

mat <- matrix(as.numeric(tm), ncol = ncol(tm))

tmpca=prcomp(mat, graph=F)
tmp.PCA=cbind(tmpca$x[,1], tmpca$x[,2])


#svg("pca.svg")
#plot(tmp.PCA)
#dev.off()


ss=read.table('samplesheet.txt',h=T,sep="\t")
ss=ss[grep(samp,ss$Sample_Name),]

ss=ss[order(ss$Sample_Name),]


sg=ss$Sample_Group
myColors <- brewer.pal(length(unique(sg))+1,"Set1")
names(myColors) <- unique(sg)
colScale <- myColors[sg]

svg(paste(samp,"_PCA of",nrow(m),"DMR with sd > ",std,".svg",sep=""))
par(mar=c(2,2,8,8) + 0.1,xpd=TRUE)
plot(tmp.PCA,col="black", bg = colScale, cex=2 ,main =paste("PCA of",nrow(m)," DMR with sd > ",std), ylim=range(tmp.PCA[,2]), pch=21)
legend( x="topright", legend=unique(sg), col=myColors, pch=20, inset=c(-0.25,0))
dev.off()

