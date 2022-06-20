
#module load gcc/8.1.0 pcre2/10.35 R/4.0.3



file="BloodiPD_VS_BloodC_DEF.csv"

for (file in dir(pattern=".bed$"))
{
m=read.table(file,sep="\t")
ss=summary(m[,3] - m[,2])

svg(paste(basename(file),"svg",sep="."))
plot(density(m[,3] - m[,2]),xlim=c(0,5000),main=basename(file))
dev.off()

tt=as.character(ss)
names(tt)=names(ss)

write.table(tt,file=paste(basename(file),"txt",sep="."))
}






for bed in *.bed; do
intersectBed -a $bed -b /slgpfs/projects/idib57/data/annot/CpG_hg19_all.bed -c > "$bed"s
done



for ( file in dir(pattern="beds$"))
{
m=read.table(file,sep="\t")    
svg(paste(file,"scatterplot.svg",sep=""))
plot((m[,3]-m[,2]),m[,74])
#abline(lm(m[,2] ~ m[,3]), col="red")
dev.off()

svg(paste(basename(file),"nCpG.svg",sep="."))
plot(density(m[,74]),main=basename(file),xlim=c(0,100))
dev.off()



ss=summary(m[,74])
tt=as.character(ss)
names(tt)=names(ss)
write.table(tt,file=paste(basename(file),"CpG.txt",sep="."))
}



for ( file in dir(pattern="bed$"))
{
m=read.table(file,sep="\t")    


hh=m$V20

hh[m$V20>0]="hyper"
hh[m$V20<=0]="hypo"

pp= table(hh)

svg(paste(file,"barplot.svg",sep=""))
barplot( data.matrix(pp/sum(pp)*100), main=paste(pp[1],"hyper"," - ",pp[2],"hypo"))
dev.off()
}


for ( file in dir(pattern="bed$"))
{
m=read.table(file,sep="\t")    


hyper=m$V7[m$V20>0]
hypo=m$V7[m$V20<=0]

nhyper= table(unlist(strsplit(hyper,",")))
nhypo= table(unlist(strsplit(hypo,",")))
total=nhyper+nhypo


hyper= nhyper/sum(nhyper)*100
hypo= nhypo/sum(nhypo)*100
total= total/sum(total)*100

svg(paste(file,"barplotIslands.svg",sep=""))
barplot( data.matrix(cbind(total,hyper,hypo)), main=paste(sum(nhyper),"hyper"," - ",sum(nhypo),"hypo"),col =brewer.pal(n = 4, name = "RdBu"))
legend("topright", legend = names(total), fill = brewer.pal(n = 4, name = "RdBu"))
dev.off()
}



chrst=read.table('chrom.state.code')


for ( file in dir(pattern="bed$"))
{
m=read.table(file,sep="\t")    


hyper=m$V8[m$V20>0]
hypo=m$V8[m$V20<=0]

hyper=(unlist(strsplit(hyper,",")))
hypo=(unlist(strsplit(hypo,",")))

hyper=chrst1[hyper]
hypo=chrst1[hypo]

nhyper= table(hyper)
nhypo= table(hypo)
total=nhyper+nhypo


hyper= nhyper/sum(nhyper)*100
hypo= nhypo/sum(nhypo)*100
total= total/sum(total)*100

svg(paste(file,"barplotChromState.svg",sep=""))
barplot( data.matrix(cbind(total,hyper,hypo)), main=paste(sum(nhyper),"hyper"," - ",sum(nhypo),"hypo"),col =brewer.pal(n = 8, name = "RdBu"))
legend("topright", legend = names(total), fill = brewer.pal(n = 8, name = "RdBu"))
dev.off()
}







