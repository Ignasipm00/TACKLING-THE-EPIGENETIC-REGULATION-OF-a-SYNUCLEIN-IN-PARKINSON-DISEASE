#!/bin/bash
#SBATCH --job-name="multiqc"
#SBATCH --workdir=.
#SBATCH --output=relativetoORF_%j.out
#SBATCH --error=relativetoORF_%j.err
#SBATCH --ntasks=20
#SBATCH --time=03:00:00
#SBATCH --cpus-per-task=1

#relativetoORF
for file in *_annot.txt; do
echo $file ' utr5:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "utr5") { count++ }} END { print count }' $file 
echo $file ' utr3:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "utr3") { count++ }} END { print count }' $file 
echo $file ' CDS:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "CDS") { count++ }} END { print count }' $file 
echo $file ' undefined:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "other") { count++ }} END { print count }' $file 
echo $file ' undefined:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "undefined") { count++ }} END { print count }' $file 
echo $file ' total:'
wc -l $file
done