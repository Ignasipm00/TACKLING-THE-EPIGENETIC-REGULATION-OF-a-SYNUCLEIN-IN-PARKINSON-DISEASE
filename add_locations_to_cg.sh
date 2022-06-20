/slgpfs/projects/idib57/data/850K/GPL21145-48548.bed
/slgpfs/projects/idib57/data/annot/CpG_island_annot_hg19.bed
/slgpfs/projects/idib57/data/annot/chromstate/E030_25_imputed12marks_segments.bed
/slgpfs/projects/idib57/data/annot/chromstate/E062_25_imputed12marks_segments.bed
/slgpfs/projects/idib57/data/annot/chromstate/E074_25_imputed12marks_segments.bed
/slgpfs/projects/idib57/data/annot/chromstate/E126_25_imputed12marks_segments.bed
/slgpfs/projects/idib57/data/annot/chromstate/E127_25_imputed12marks_segments.bed

for bedd in *.bedd; do
intersectBed -header -a $bedd -b /slgpfs/projects/idib57/data/annot/chromstate/E127_25_imputed12marks_segments.bed -loj | awk 'BEGIN {OFS="\t"}; {print $1,$2,$3,$7}' > "$bedd"s
done


for bedd in *.bedd; do
bedtools sort -i $bedd   > "$bedd"s
done

for bedd in *.bedd; do
bedtools merge -i $bedd -o collapse -c 4 > "$bedd"s
done

for bedd in *.bedd; do
cut -d$'\t' -f4 $bedd > "$bedd"s
done

mv *.beddsssee127 ../methyl_diff/


paste -d' ' test1.bed test.bedo > _final_.bed
paste test1.bed test1.bed0


paste BloodiPD_VS_BloodC.bedds BloodiPD_VS_BloodC.beddssscg BloodiPD_VS_BloodC.beddsssisland BloodiPD_VS_BloodC.beddssse30 BloodiPD_VS_BloodC.beddssse62 BloodiPD_VS_BloodC.beddssse74 BloodiPD_VS_BloodC.beddssse126 BloodiPD_VS_BloodC.beddssse127> BloodiPD_VS_BloodC_final_.bed
paste DAnC_VS_BloodC.bedds DAnC_VS_BloodC.beddssscg DAnC_VS_BloodC.beddsssisland DAnC_VS_BloodC.beddssse30 DAnC_VS_BloodC.beddssse30 DAnC_VS_BloodC.beddssse62 DAnC_VS_BloodC.beddssse74 DAnC_VS_BloodC.beddssse126 DAnC_VS_BloodC.beddssse127 > DAnC_VS_BloodC_final_.bed
paste DAniPD_VS_DAnC.bedds DAniPD_VS_DAnC.beddssscg DAniPD_VS_DAnC.beddsssisland DAniPD_VS_DAnC.beddssse30 DAniPD_VS_DAnC.beddssse62 DAniPD_VS_DAnC.beddssse74 DAniPD_VS_DAnC.beddssse126 DAniPD_VS_DAnC.beddssse127> DAniPD_VS_DAnC_final_.bed
paste DAnL2PD_VS_DAnC.bedds DAnL2PD_VS_DAnC.beddssscg DAnL2PD_VS_DAnC.beddsssisland DAnL2PD_VS_DAnC.beddssse30 DAnL2PD_VS_DAnC.beddssse62 DAnL2PD_VS_DAnC.beddssse74 DAnL2PD_VS_DAnC.beddssse126 DAnL2PD_VS_DAnC.beddssse127 > DAnL2PD_VS_DAnC_final_.bed
paste DAnL2PD_VS_DAniPD.bedds DAnL2PD_VS_DAniPD.beddssscg DAnL2PD_VS_DAniPD.beddsssisland DAnL2PD_VS_DAniPD.beddssse30 DAnL2PD_VS_DAniPD.beddssse62 DAnL2PD_VS_DAniPD.beddssse74 DAnL2PD_VS_DAniPD.beddssse126 DAnL2PD_VS_DAniPD.beddssse127> DAnL2PD_VS_DAniPD_final_.bed
paste DAnPD_VS_BloodiPD.bedds DAnPD_VS_BloodiPD.beddssscg DAnPD_VS_BloodiPD.beddsssisland DAnPD_VS_BloodiPD.beddssse30 DAnPD_VS_BloodiPD.beddssse62 DAnPD_VS_BloodiPD.beddssse74 DAnPD_VS_BloodiPD.beddssse126 DAnPD_VS_BloodiPD.beddssse127 > DAnPD_VS_BloodiPD_final_.bed
paste DAnPD_VS_DAnC.bedds DAnPD_VS_DAnC.beddssscg DAnPD_VS_DAnC.beddsssisland DAnPD_VS_DAnC.beddssse30 DAnPD_VS_DAnC.beddssse62 DAnPD_VS_DAnC.beddssse74 DAnPD_VS_DAnC.beddssse126 DAnPD_VS_DAnC.beddssse127 > DAnPD_VS_DAnC_final_.bed
paste DAn_VS_Blood.bedds DAn_VS_Blood.beddssscg DAn_VS_Blood.beddsssisland DAn_VS_Blood.beddssse30 DAn_VS_Blood.beddssse62 DAn_VS_Blood.beddssse74 DAn_VS_Blood.beddssse126 DAn_VS_Blood.beddssse127 > DAn_VS_Blood_final_.bed
