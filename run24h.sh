input=$1

echo "$input

" >> /slgpfs/projects/idib57/GA_001_21_Parkinson/run.24h.cpt ;

sbatch < /slgpfs/projects/idib57/GA_001_21_Parkinson/run.24h.cpt ;

sed -i '10,$d' /slgpfs/projects/idib57/GA_001_21_Parkinson/run.24h.cpt