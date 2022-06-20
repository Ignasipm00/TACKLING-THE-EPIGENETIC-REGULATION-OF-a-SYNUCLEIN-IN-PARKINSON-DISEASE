
# extract coordinates from compacted and already filtered tables
for file in *; do
cut -d$'\t' -f1,2,3,4 $file > ${file/pval.bed/coords.bed} 
done


#for  every file
intersectBed -a DAnPD_VS_DAnC_coords.bed -b ../../st9/DAnPD_VS_DAnC_annot.txt -loj > DAnPD_VS_DAnC_expanded.bed 

# expand 
# first prepare 
for file in *_expanded.bed; do
cat $file | tr '\t' ',' > ${file/_expanded.bed/_comas.bed}
sort -u -t, -k34,35 ${file/_expanded.bed/_comas.bed} > ${file/_expanded.bed/_comas_u.bed}
cat ${file/_expanded.bed/_comas_u.bed} |tr ',' '\t' > ${file/_expanded.bed/_tab_u.bed}
bedtools sort -i ${file/_expanded.bed/_tab_u.bed} > ${file/_expanded.bed/_tab_sorted.bed}
done