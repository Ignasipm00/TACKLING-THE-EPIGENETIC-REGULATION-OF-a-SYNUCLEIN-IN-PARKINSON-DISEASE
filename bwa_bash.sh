#!/bin/bash
#SBATCH --job-name="map13"
#SBATCH --workdir=.
#SBATCH --output=map13_%j.out
#SBATCH --error=map13_%j.err
#SBATCH --ntasks=20
#SBATCH --time=72:00:00
#SBATCH --cpus-per-task=1

module load intel python samtools bwa

genome=/slgpfs/projects/idib57/data/genome/BWAIndex/hg19.fa

folder=/slgpfs/projects/idib57/GA_001_21_Parkinson/DNA/

bwameth.py --threads 32 --reference $genome $folder/trimmed_DNA/DNA_13/DNA_13_R1_trimmed.fq.gz $folder/trimmed_DNA/DNA_13/DNA_13_R2_trimmed.fq.gz -t 12 | samtools view -b - > $folder/maps/DNA_13.bam
