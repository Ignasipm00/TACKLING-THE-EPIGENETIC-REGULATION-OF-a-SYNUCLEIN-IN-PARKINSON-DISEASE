#!/bin/bash
#SBATCH --job-name="multiqc"
#SBATCH --workdir=.
#SBATCH --output=multiqc_dna_%j.out
#SBATCH --error=multiqc_dna_%j.err
#SBATCH --ntasks=20
#SBATCH --time=03:00:00
#SBATCH --cpus-per-task=1

#module load java fastqc

#fastqc fastq/SP-01-3w_R1.fq.gz -o QC/

module load intel python

multiqc QC/ -o MultiQC_project/
