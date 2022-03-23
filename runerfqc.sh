#!/bin/bash
#SBATCH --job-name="dna1"
#SBATCH --workdir=.
#SBATCH --output=fastqc_dna1_%j.out
#SBATCH --error=fastqc_dna1_%j.err
#SBATCH --ntasks=20
#SBATCH --time=04:00:00
#SBATCH --cpus-per-task=1

module load java fastqc

fastqc trimmed_DNA/DNA_20/DNA_20_R1_trimmed.fq.gz -o QC_trimmed_DNA/
fastqc trimmed_DNA/DNA_20/DNA_20_R2_trimmed.fq.gz -o QC_trimmed_DNA/