#order

orignal order: annot.bed -> final.bed -> annot.txt
,1. _final/geneAnnot.txt/geneAnnot.bed,2. ultimas columnas de _final al final de tot ,3. statistical measures together ,4. Featuer gene_name together, after all the other feature things ,5. Begin with chr, start, end, width 

_final(1,2,3),geneAnnot.txt(7,10,18,11,12,13,14,8,9,15,16,17),_final(4,5,6,7,8,9,10,16,17,18,19,20,21(22,23,24??????),)geneAnnot.bed((2,3-->repeated coordinates)4,7,8,9,10,11,12,13,14,15),_final(28 to 61)

#remove header------------
for txt in *.txt;  do
tail -n +2 $txt > "$txt"_
done
#-------------------------

#number of columns---------------------------
awk '{print NF}' $bedd | sort -nu | tail -n 1
#--------------------------------------------


BloodiPD_VS_Blood DAnL2PD_VS_DAnC.bed DAnL2PD_VS_DAniPD.bed

cut -d$'\t' -f1,2,3,4,5,9,10,11,12,13,14,15,19,20,21,22,23,24,25,30,31,32,33,34,35,36,37,38,39,81,82,83,84,85,86,87,88,89,90,91 DAnPD_VS_BloodiPD.end > DAnPD_VS_BloodiPD.first   
cut -d$'\t' -f1,2,3,4,5,9,10,11,12,13,14,15,19,20,21,22,23,24,25,30,31,32,33,34,35,36,37,38,39,81,82,83,84,85,86,87,88,89,90,91 DAnPD_VS_DAnC.end > DAnPD_VS_DAnC.first            
cut -d$'\t' -f1,2,3,4,5,9,10,11,12,13,14,15,19,20,21,22,23,24,25,30,31,32,33,34,35,36,37,38,39,81,82,83,84,85,86,87,88,89,90,91 DAn_VS_Blood.end > DAn_VS_Blood.first     

cut -d$'\t' -f43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,67,68,69,70,71,72,73,74,75,76 DAnPD_VS_BloodiPD.end > DAnPD_VS_BloodiPD_FINAL_COLUMNS.bed
cut -d$'\t' -f43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,67,68,69,70,71,72,73,74,75,76 DAnPD_VS_DAnC.end > DAnPD_VS_DAnC_FINAL_COLUMNS.bed     
cut -d$'\t' -f43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,67,68,69,70,71,72,73,74,75,76 DAn_VS_Blood.end > DAn_VS_Blood_FINAL_COLUMNS.bed     


paste DAnPD_VS_BloodiPD.first DAnPD_VS_BloodiPD_FINAL_COLUMNS.bed > DAnPD_VS_BloodiPD.bed
paste DAnPD_VS_DAnC.first DAnPD_VS_DAnC_FINAL_COLUMNS.bed > DAnPD_VS_DAnC.bed
paste DAn_VS_Blood.first DAn_VS_Blood_FINAL_COLUMNS.bed > DAn_VS_Blood.bed

  
cut -d$'\t' -f1,2,3,4,5,9,10,11,12,13,14,15,19,20,21,22,23,24,25,30,31,32,33,34,35,36,37,38,39,81,82,83,84,85,86,87,88,89,90,91  DAnC_VS_BloodC.bg > DAnC_VS_BloodC.first DAnC_VS_BloodC             
cut -d$'\t' -f1,2,3,4,5,9,10,11,12,13,14,15,19,20,21,22,23,24,25,29,30,31,73,74,75,76,77,78,79,80,81,82,83 DAniPD_VS_DAnC.base > DAniPD_VS_DAnC.first      
       

cut -d$'\t' -f43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,67,68,69,70,71,72,73,74,75,76 DAnC_VS_BloodC.bg > DAnC_VS_BloodC_FINAL_COLUMNS.bed  DAnC_VS_BloodC    
cut -d$'\t' -f35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,67,68 DAniPD_VS_DAnC.base > DAniPD_VS_DAnC_FINAL_COLUMNS.bed    

# separate in order
for bed in *.end; do
cut -d$'\t' -f1,2,3,4,5,9,10,11,12,13,14,15,19,20,21,22,23,24,25,30,31,32,33,34,35,36,37,38,39,81,82,83,84,85,86,87,88,89,90,91 $bed > ${bed/.end/.first}
done

for bed in *.hola; do
cut -d$'\t' -f43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,67,68,69,70,71,72,73,74,75,76 $bed > ${bed/.hola/_FINAL_COLUMNS.bed}
done

out --> 76,77,78.79,80

#-------------

mkdir test
cd test
cp ../st9/*.annot.txt .

#--------------

for txt in *.annot.txt; do
cut -d$'\t' -f81,82,83,84 $txt > ${txt/.annot.txt/_second.txt}
done

for txt in *.annot.txt; do
cut -d$'\t' -f1,2,3,4,5,6,7,8,9,10,11,12 $txt > ${txt/.annot.txt/_first.txt}
done

for bed in *.annot.txt; do
cut -d$'\t' -f13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75 $bed > ${bed/.annot.txt/_third.txt}
done

paste BloodiPD_VS_BloodC_first.txt BloodiPD_VS_BloodC_second.txt BloodiPD_VS_BloodC_third.txt > BloodiPD_VS_BloodC_annot.txt
paste DAniPD_VS_DAnC_first.txt DAniPD_VS_DAnC_second.txt DAniPD_VS_DAnC_third.txt > DAniPD_VS_DAnC_annot.txt  
paste DAnL2PD_VS_DAniPD_first.txt DAnL2PD_VS_DAniPD_second.txt DAnL2PD_VS_DAniPD_third.txt > DAnL2PD_VS_DAniPD_annot.txt
paste DAnPD_VS_DAnC_first.txt DAnPD_VS_DAnC_second.txt DAnPD_VS_DAnC_third.txt > DAnPD_VS_DAnC_annot.txt
paste DAnC_VS_BloodC_first.txt DAnC_VS_BloodC_second.txt DAnC_VS_BloodC_third.txt > DAnC_VS_BloodC_annot.txt      
paste DAnL2PD_VS_DAnC_first.txt DAnL2PD_VS_DAnC_second.txt DAnL2PD_VS_DAnC_third.txt > DAnL2PD_VS_DAnC_annot.txt  
paste DAnPD_VS_BloodiPD_first.txt DAnPD_VS_BloodiPD_second.txt DAnPD_VS_BloodiPD_third.txt > DAnPD_VS_BloodiPD_annot.txt
paste DAn_VS_Blood_first.txt DAn_VS_Blood_second.txt DAn_VS_Blood_third.txt > DAn_VS_Blood_annot.txt

rm *_first*
rm *_second*
rm *_third*
rm *.annot.txt

for file in *_annot.txt; do
cat $file | tr ',' '/' > ${file/_annot.txt/.test}
done

for file in *.test; do
cat $file | tr '\t' ',' > ${file/.test/.csv}
done

rm *_annot.txt
rm *.test


for file in *.csv; do 
sed -i 1i"chrom,start,end,width,rs,CGID,cpgshore,E30_segments,E62_segments,E74_segments,E126_segments,E127_segments,promoterLevel,geneLevel,ExonIntron,Exons,strand,L,area,beta,stat,pval,qval,index.start,index.end,index.width,strand,,,,,,,,strand,peak,feature,feature.ranges.start,feature.ranges.end,feature.ranges.width,feature.strand,distance,insideFeature,distanceToSite,gene_name,DNA_10,DNA_11,DNA_12,DNA_13,DNA_14,DNA_15,DNA_16,DNA_17,DNA_18,DNA_19,DNA_1,DNA_20,DNA_2,DNA_3,DNA_4,DNA_5,DNA_6,DNA_7,DNA_8,DNA_9,SP-01-3w,SP-02-3w,SP-04-3w,SP-05-3w,SP-06-3w,SP-08-3w,SP-09-3w,SP-10-3w,SP-11-3w,SP-12-3w,SP-13-3w,SP-15-3w,SP-16-3w,SP-17-3w" $file
done

head -2 *.csv

#---------------------------
for txt in *.end; do
cut -d$'\t' -f22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92 $txt > ${txt/.end/.ventinoven}
done




for bed in *.end; do
cut -d$'\t' -f35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68 $bed > ${bed/.end/_FINAL_COLUMNS.bed}
done



feature starte feature end

chr, index start index end repeated

#join first two tables

#paste BloodiPD_VS_BloodC_1.bed BloodiPD_VS_BloodC_2.bed BloodiPD_VS_BloodC_3.bed BloodiPD_VS_BloodC_4.bed BloodiPD_VS_BloodC_5.bed > _BloodiPD_VS_BloodC.bed
#

paste _BloodiPD_VS_BloodC.bed BloodiPD_VS_BloodC_FINAL_COLUMNS.bed > f_BloodiPD_VS_BloodC.bed

#paste DAnC_VS_BloodC_1.bed DAnC_VS_BloodC_2.bed DAnC_VS_BloodC_3.bed DAnC_VS_BloodC_4.bed DAnC_VS_BloodC_5.bed > _DAnC_VS_BloodC.bed
#

paste _DAnC_VS_BloodC.bed DAnC_VS_BloodC_FINAL_COLUMNS.bed > f_DAnC_VS_BloodC.bed

#paste DAniPD_VS_DAnC_1.bed DAniPD_VS_DAnC_2.bed DAniPD_VS_DAnC_3.bed  DAniPD_VS_DAnC_4.bed DAniPD_VS_DAnC_5.bed > _DAniPD_VS_DAnC.bed
#

paste _DAniPD_VS_DAnC.bed DAniPD_VS_DAnC_FINAL_COLUMNS.bed > f_DAniPD_VS_DAnC.bed

#paste DAnL2PD_VS_DAnC_1.bed DAnL2PD_VS_DAnC_2.bed DAnL2PD_VS_DAnC_3.bed DAnL2PD_VS_DAnC_4.bed DAnL2PD_VS_DAnC_5.bed > _DAnL2PD_VS_DAnC.bed
#

paste _DAnL2PD_VS_DAnC.bed DAnL2PD_VS_DAnC_FINAL_COLUMNS.bed > f_DAnL2PD_VS_DAnC.bed

#paste DAnL2PD_VS_DAniPD_1.bed DAnL2PD_VS_DAniPD_2.bed DAnL2PD_VS_DAniPD_3.bed DAnL2PD_VS_DAniPD_4.bed DAnL2PD_VS_DAniPD_5.bed >  _DAnL2PD_VS_DAniPD.bed
#

paste _DAnL2PD_VS_DAniPD.bed DAnL2PD_VS_DAniPD_FINAL_COLUMNS.bed > f_DAnL2PD_VS_DAniPD.bed

#paste DAnPD_VS_BloodiPD_1.bed DAnPD_VS_BloodiPD_2.bed DAnPD_VS_BloodiPD_3.bed DAnPD_VS_BloodiPD_4.bed DAnPD_VS_BloodiPD_5.bed > _DAnPD_VS_BloodiPD.bed
#
paste _DAnPD_VS_BloodiPD.bed DAnPD_VS_BloodiPD_FINAL_COLUMNS.bed > f_DAnPD_VS_BloodiPD.bed

#paste DAnPD_VS_DAnC_1.bed DAnPD_VS_DAnC_2.bed DAnPD_VS_DAnC_3.bed DAnPD_VS_DAnC_4.bed DAnPD_VS_DAnC_5.bed > _DAnPD_VS_DAnC.bed
#

paste _DAnPD_VS_DAnC.bed DAnPD_VS_DAnC_FINAL_COLUMNS.bed > f_DAnPD_VS_DAnC.bed

#paste DAn_VS_Blood_1.bed DAn_VS_blood_2.bed DAn_VS_blood_3.bed DAn_VS_blood_4.bed DAn_VS_Blood_5.bed >  _DAn_VS_Blood.bed
#

paste _DAn_VS_Blood.bed DAn_VS_Blood_FINAL_COLUMNS.bed > f_DAn_VS_Blood.bed


#remove header
for bed in a_*;  do
tail -n +2 $bed > "$bed"_
done

#join and interesct final tables
for file in *nnot.bed; do
intersectBed -a DAniPD_VS_DAnC.end -b DAniPD_VS_DAnC.txt -loj > DAniPD_VS_DAnC.endo
done


for file in *nnot.bed; do
intersectBed -a $file -b ${file/_geneAnnot.bed/_final.inter} -loj > ${file/_geneAnnot.bed/.end}
done



#add rs
for file in *.bed do;
intersectBed -a $file -b "ubicacio del bedfile amb els rs" -loj > ${file/.bed/.end}
done