erase rows --> sed '/MARKER/d' example.txt > newfile.txt

select rows based on threshold --> awk -F"\t" 'NR==1{print;next}$(COLUMN NUMBER)>(THRESHOLD TO FOLLOW)' exapmle.txt > newfile.txt #to keep the header

Erase all rows from chrX/chrY (not into account from sex)

for file in _comp.bed;do
sed '/chrX/d' $file > ${file/_comp.bed/_noX.bed}
done

for file in *_noX.bed*;do
sed '/chrY/d' $file > ${file/_noX.txt/noY.bed}
done

Column beta (select all values >= 0.25)
for file in *_noY.bed; do
awk -F"\t" 'NR==0{print;next}$21>=(0.25)' $file > ${file/_noY.bed/_over.bed}
awk -F"\t" 'NR==0{print;next}$21<=(-0.25)' $file > ${file/_noY.bed/_under.bed}
done

cat BloodiPD_VS_BloodC_over.bed BloodiPD_VS_BloodC_under.bed > BloodiPD_VS_BloodC_beta.bed 
cat DAnC_VS_BloodC_over.bed DAnC_VS_BloodC_under.bed > DAnC_VS_BloodC_beta.bed 
cat DAniPD_VS_DAnC_over.bed DAniPD_VS_DAnC_under.bed > DAniPD_VS_DAnC_beta.bed 
cat DAnL2PD_VS_DAnC_over.bed DAnL2PD_VS_DAnC_under.bed > DAnL2PD_VS_DAnC_beta.bed 
cat DAnL2PD_VS_DAniPD_over.bed DAnL2PD_VS_DAniPD_under.bed > DAnL2PD_VS_DAniPD_beta.bed 
cat DAnPD_VS_BloodiPD_over.bed DAnPD_VS_BloodiPD_under.bed > DAnPD_VS_BloodiPD_beta.bed 
cat DAnPD_VS_DAnC_over.bed DAnPD_VS_DAnC_under.bed > DAnPD_VS_DAnC_beta.bed
cat DAn_VS_Blood_over.bed DAn_VS_Blood_under.bed > DAn_VS_Blood_beta.bed

rm *over*
rm *under*

Column pval (pval<=0.05)

for file in *_beta.bed;do
awk -F"\t" 'NR==0{print;next}$23<=(0.05)' $file > ${file/_beta.bed/_pval.bed}
done


#--> maybe from this one only in DAn (qval<= 0.05)
for file in *pval*;do
awk -F"\t" 'NR==0{print;next}$24<=(0.05)' $file > ${file/_pval.bed/_qval.bed}
done


for file in *_pval.txt;do
uniq $file > ${file/_pval.txt/_uniqPval.txt}
done

for file in *_qval.txt;do
uniq $file > ${file/_qval.txt/_uniqQval.txt}
done

#--------

for file in *_uniqPval.txt;do
cat $file | tr '\t' ',' > ${file/_uniqPval.txt/_uniqPval.com}
done

for file in *_uniqQval.txt;do
cat $file | tr '\t' ',' > ${file/_uniqQval.txt/_uniqQval.com}
done

rm *_uniqPval.txt
rm *_uniqQval.txt

for file in *.com;do
sort -u -t, -k2,3 $file > ${file/.com/.txt}
done


#
echo 'funciona'
echo 'pval'
for file in *_pval.txt;do
uniq $file > ${file/_pval.txt/_uniqPval.txt}
echo $file
done

echo 'qval'
for file in *_qval.txt;do
uniq $file > ${file/_qval.txt/_uniqQval.txt}
echo $file
done

echo 'uniqPval'
for file in *_uniqPval.txt;do
cat $file | tr '\t' ',' > ${file/_uniqPval.txt/_uniqPval.com}
echo $file
done

echo 'uniqQval'
for file in *_uniqQval.txt;do
cat $file | tr '\t' ',' > ${file/_uniqQval.txt/_uniqQval.com}
echo $file
done

echo'remove uniq.txt'
rm *_uniqPval.txt
rm *_uniqQval.txt

echo  'sort'
for file in *.com;do
sort -u -t, -k35 $file > ${file/.com/.txt}
echo $file
done
#


first 1000 smallest values

for file in *_qval.txt; do
sort -t, -k23,23 $file > $${file/_qval.txt/_Q1000.csv}
done

for file in *_pval.txt; do
sort -t, -k22,22 $file > $${file/_pval.txt/_P1000.csv}
done

mv *_Q1000.csv 1000
mv *_P1000.csv 1000