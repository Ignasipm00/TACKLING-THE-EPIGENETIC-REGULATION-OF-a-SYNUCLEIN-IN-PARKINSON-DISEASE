#!/bin/bash
#SBATCH --job-name="trim20"
#SBATCH --workdir=.
#SBATCH --output=trimm20_%j.out
#SBATCH --error=trimm20_%j.err
#SBATCH --ntasks=20
#SBATCH --time=20:00:00
#SBATCH --cpus-per-task=1

module load intel python
module load java trimgalore

cd /slgpfs/projects/idib57/giancarlo/BI_001_21_Parkinson/004_0157/

trim_galore raw_data/DNA_20_R1.fq.gz raw_data/DNA_20_R2.fq.gz -o /slgpfs/projects/idib57/GA_001_21_Parkinson/trimmed_DNA/DNA_20