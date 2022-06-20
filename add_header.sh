for file in */*.csv; do
sed -i 1i",COUNTS#,COUNTS%" $file
done

for file in *.csv; do
cat $file| tr ' ' ',' | tr '=' ' ' > ${file/.csv/_.csv}
done

for file in */*.csv; do
sed -i 1i"chrom,start,end,width,chrom,rs,CGID,cpgshore,E30_segments,E62_segments,E74_segments,E126_segments,E127_segments,promoterLevel,geneLevel,ExonIntron,Exons,strand,L,area,beta,stat,pval,qval,strand,,UCSCid,,gene_name_onsite,,strand,peak,feature,feature.ranges.start,feature.ranges.end,feature.ranges.width,feature.strand,distance,insideFeature,distanceToSite,gene_name,DNA_10,DNA_11,DNA_12,DNA_13,DNA_14,DNA_15,DNA_16,DNA_17,DNA_18,DNA_19,DNA_1,DNA_20,DNA_2,DNA_3,DNA_4,DNA_5,DNA_6,DNA_7,DNA_8,DNA_9,SP-01-3w,SP-02-3w,SP-04-3w,SP-05-3w,SP-06-3w,SP-08-3w,SP-09-3w,SP-10-3w,SP-11-3w,SP-12-3w,SP-13-3w,SP-15-3w,SP-16-3w,SP-17-3w" $file
done