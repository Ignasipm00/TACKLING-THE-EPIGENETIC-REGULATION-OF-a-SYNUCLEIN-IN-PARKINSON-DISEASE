cat chr*_results/BloodiPD_VS_BloodC_chr*_results.csv > BloodiPD_VS_BloodC_allchr_results.csv

sed -i '/seqnames/d' BloodiPD_VS_BloodC_allchr_results.csv

cat h BloodiPD_VS_BloodC_allchr_results.csv > BloodiPD_VS_BloodC_allchr_results.csvs

mv BloodiPD_VS_BloodC_allchr_results.csvs BloodiPD_VS_BloodC_allchr_results.csv




