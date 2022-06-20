module load bedtools

for file in *.bedGraph; do

echo "

intersectBed -wb -loj -a sorted.CpGsites.bed -b $file | awk '{print $7}' > ${file/.bedGrap/.txt}

" >> /home/idib57/idib57898/cpt/run.05h.cpt ;

sbatch /home/idib57/idib57898/cpt/run.05h.cpt ;

sed -i '10,$d' /home/idib57/idib57898/cpt/run.05h.cpt

done
