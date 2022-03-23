#!/bin/bash
#SBATCH --job-name="multiqc"
#SBATCH --workdir=.
#SBATCH --output=multiqc_dna_%j.out
#SBATCH --error=multiqc_dna_%j.err
#SBATCH --ntasks=20
#SBATCH --time=03:00:00
#SBATCH --cpus-per-task=1

module load intel python

multiqc QC/ -o MultiQC_project/