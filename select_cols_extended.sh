cat BloodiPD_VS_BloodC_allchr_results.csv | tr ',' '\t' | tr -d '"' > BloodiPD_VS_BloodC.bed
cat DAnC_VS_BloodC_allchr_results.csv | tr ',' '\t' | tr -d '"' > DAnC_VS_BloodC.bed
cat DAniPD_VS_DAnC_allchr_results.csv | tr ',' '\t' | tr -d '"' > DAniPD_VS_DAnC.bed
cat DAnL2PD_VS_DAnC_allchr_results.csv | tr ',' '\t' | tr -d '"' > DAnL2PD_VS_DAnC.bed
cat DAnL2PD_VS_DAniPD_allchr_results.csv | tr ',' '\t' | tr -d '"' > DAnL2PD_VS_DAniPD.bed
cat DAnPD_VS_BloodiPD_allchr_results.csv | tr ',' '\t' | tr -d '"' > DAnPD_VS_BloodiPD.bed
cat DAnPD_VS_DAnC_allchr_results.csv | tr ',' '\t' | tr -d '"' > DAnPD_VS_DAnC.bed
cat DAn_VS_blood_allchr_results.csv | tr ',' '\t' | tr -d '"' > DAn_VS_Blood.bed

cut -d$'\t' -f2,3,4 BloodiPD_VS_BloodC.bed > BloodiPD_VS_BloodC.bedo
cut -d$'\t' -f2,3,4 DAnC_VS_BloodC.bed > DAnC_VS_BloodC.bedo
cut -d$'\t' -f1,2,3 DAniPD_VS_DAnC.bed > DAniPD_VS_DAnC.bedo
cut -d$'\t' -f2,3,4 DAnL2PD_VS_DAnC.bed > DAnL2PD_VS_DAnC.bedo
cut -d$'\t' -f2,3,4 DAnL2PD_VS_DAniPD.bed > DAnL2PD_VS_DAniPD.bedo
cut -d$'\t' -f2,3,4 DAnPD_VS_BloodiPD.bed > DAnPD_VS_BloodiPD.bedo
cut -d$'\t' -f2,3,4 DAnPD_VS_DAnC.bed > DAnPD_VS_DAnC.bedo
cut -d$'\t' -f2,3,4 DAn_VS_Blood.bed > DAn_VS_Blood.bedo

tail -n +2 BloodiPD_VS_BloodC.bedo > BloodiPD_VS_BloodC.bedd
tail -n +2 DAnC_VS_BloodC.bedo > DAnC_VS_BloodC.bedd
tail -n +2 DAniPD_VS_DAnC.bedo > DAniPD_VS_DAnC.bedd
tail -n +2 DAnL2PD_VS_DAnC.bedo > DAnL2PD_VS_DAnC.bedd
tail -n +2 DAnL2PD_VS_DAniPD.bedo > DAnL2PD_VS_DAniPD.bedd
tail -n +2 DAnPD_VS_BloodiPD.bedo > DAnPD_VS_BloodiPD.bedd
tail -n +2 DAnPD_VS_DAnC.bedo > DAnPD_VS_DAnC.bedd
tail -n +2 DAn_VS_Blood.bedo > DAn_VS_Blood.bedd

mv *.bedd ../methyl_diff/
