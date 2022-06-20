#!/bin/bash
#SBATCH --job-name="tester"
#SBATCH --output=tester_%j.out
#SBATCH --error=tester_%j.err
#SBATCH --ntasks=20
#SBATCH --time=06:00:00
#SBATCH --cpus-per-task=1

for file in *_comp.bed;do
sed '/chrX/d' $file > ${file/_comp.bed/_noX.bed}
done

for file in *_noX.bed*;do
sed '/chrY/d' $file > ${file/_noX.bed/noY.bed}
done


for file in *_noY.bed; do
awk -F"\t" 'NR==0{print;next}$21>=(0.25)' $file > ${file/_noY.bed/_over.bed}
awk -F"\t" 'NR==0{print;next}$21<=(-0.25)' $file > ${file/_noY.bed/_under.bed}
done

awk 'BEGIN {OFS='\t'}; {if ($21 >= 0.25 || $21 <= -0.25) print $0}'

awk 'BEGIN {OFS='\t'}; {if ($23 <= 0.05) print $0}'

cat BloodiPD_VS_BloodC_over.bed BloodiPD_VS_BloodC_under.bed > BloodiPD_VS_BloodC_beta.bed 
cat DAnC_VS_BloodC_over.bed DAnC_VS_BloodC_under.bed > DAnC_VS_BloodC_beta.bed 
cat DAniPD_VS_DAnC_over.bed DAniPD_VS_DAnC_under.bed > DAniPD_VS_DAnC_beta.bed 
cat DAnL2PD_VS_DAnC_over.bed DAnL2PD_VS_DAnC_under.bed > DAnL2PD_VS_DAnC_beta.bed 
cat DAnL2PD_VS_DAniPD_over.bed DAnL2PD_VS_DAniPD_under.bed > DAnL2PD_VS_DAniPD_beta.bed 
cat DAnPD_VS_BloodiPD_over.bed DAnPD_VS_BloodiPD_under.bed > DAnPD_VS_BloodiPD_beta.bed 
cat DAnPD_VS_DAnC_over.bed DAnPD_VS_DAnC_under.bed > DAnPD_VS_DAnC_beta.bed
cat DAn_VS_Blood_over.bed DAn_VS_Blood_under.bed > DAn_VS_Blood_beta.bed


for file in *_beta.bed;do
awk -F"\t" 'NR==0{print;next}$23<=(0.05)' $file > ${file/_beta.bed/_pval.bed}
done


#--> maybe from this one only in DAn (qval<= 0.05)
for file in *pval*;do
awk -F"\t" 'NR==0{print;next}$24<=(0.05)' $file > ${file/_pval.bed/_qval.bed}
done