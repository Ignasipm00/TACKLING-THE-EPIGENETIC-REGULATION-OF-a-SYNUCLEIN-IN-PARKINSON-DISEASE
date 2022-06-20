# to only take unique columns, meaning that there  are no repeated
uniq such as -> unqi results.bed > CpGsites.bed


####################################################################################################################################################################################################################################################################################################################################################
####################################################################################################################################################################################################################################################################################################################################################
####################################################################################################################################################################################################################################################################################################################################################


# Pipeline to transform from csv to bed and bed to big Bed

# transform from csv to bed by replacing commas with tabs and removing comillas 
cat BloodiPD_VS_BloodC_allchr_results.csv | tr ',' '\t' | tr -d '"' > BloodiPD_VS_BloodC_allchr_results.bed

#bed to csv
for file in *.bed; do
cat $file | tr ',' ' ' |tr '\t' ',' > ${file/.bed/.csv}
done

# Already transformed to bed file, now time to transform to big bed
# To do this, first of all certain columns must be selected, the header removed, 
# and the rows sorted in chromosome order for the bedToBigBed program to work correctly

# seleccionar columnes 2, 3, 4, 9, seqname, start, end and beta 
cut -d$'\t' -f4 BloodiPD_VS_BloodC.bedd > BloodiPD_VS_BloodC.bedo

# remove the header
tail -n +2 BloodiPD_VS_BloodC.bed > BloodiPD_VS_BloodC_.bed

# to sort by order of chromosome to be able to convert from .bed to .bb (bigBed)
sort -k1,1 -k2,2n BloodiPD_VS_BloodC_unordered.bed > BloodiPD_VS_BloodC_ordered.bed
 
# to convert from bed file to big Bed file, this format is better and allows to upload files
# to the track hub  and then to ucsc genom browser for proper visualization
/slgpfs/projects/idib57/soft/bedToBigBed BloodiPD_VS_BloodC_ordered.bed /slgpfs/projects/idib57/data/genome/human_genome/human.hg19.genome BloodiPD_VS_BloodC.bb


mv *.sh /home/idib57/idib57898/sh/
mkdir /home/idib57/idib57898/cpt
mv *.cpt /home/idib57/idib57898/cpt/