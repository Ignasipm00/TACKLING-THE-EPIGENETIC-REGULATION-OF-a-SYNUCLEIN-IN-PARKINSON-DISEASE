#!/bin/bash
#SBATCH --job-name="mergeSP"
#SBATCH --workdir=.
#SBATCH --output=mergeDNA2_%j.out
#SBATCH --error=mergeDNA_%j.err
#SBATCH --ntasks=20
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=1

module load htslib/1.14 methyldackel

genome=/slgpfs/projects/idib57/data/genome/BWAIndex/hg19.fa

name=SP-17-3w_extract_CpG

#MethylDackel extract $genome bam/$name.bam -o methyl_output/$name"_extract"

MethylDackel mergeContext $genome methyl_output/$name.bedGraph -o methyl_output/$name"_merge"

#MethylDackel mbias $genome bam/$name.bam methyl_output/$name"_mbias"

#MethylDackel perRead $genome bam/DNA_1.bam -o methyl_output/methyl13_xread