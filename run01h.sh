input=$1

echo "$input

" >> /slgpfs/projects/idib57/GA_001_21_Parkinson/run.01h.cpt ;

sbatch < /slgpfs/projects/idib57/GA_001_21_Parkinson/run.01h.cpt ;

sed -i '10,$d' /slgpfs/projects/idib57/GA_001_21_Parkinson/run.01h.cpt