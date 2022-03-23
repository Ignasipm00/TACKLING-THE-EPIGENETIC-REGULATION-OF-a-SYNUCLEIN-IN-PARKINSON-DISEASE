input=$1

echo "$input

" >> /slgpfs/projects/idib57/GA_001_21_Parkinson/sbatch.3h.cpt1 ;

sbatch < /slgpfs/projects/idib57/GA_001_21_Parkinson/sbatch.3h.cpt1 ;

sed -i '10,$d' /slgpfs/projects/idib57/GA_001_21_Parkinson/sbatch.3h.cpt1