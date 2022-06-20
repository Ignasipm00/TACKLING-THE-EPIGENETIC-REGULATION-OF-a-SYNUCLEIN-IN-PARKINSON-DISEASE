#!/bin/bash
#SBATCH --job-name="multiqc"
#SBATCH --workdir=.
#SBATCH --output=multiqc_dna_%j.out
#SBATCH --error=multiqc_dna_%j.err
#SBATCH --ntasks=20
#SBATCH --time=03:00:00
#SBATCH --cpus-per-task=1


cd methyl_output/
/slgpfs/projects/idib57/soft/bedGraphToBigWig /