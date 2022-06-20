#!/bin/bash
#SBATCH --job-name="multiqc"
#SBATCH --workdir=.
#SBATCH --output=realtivetoisland_%j.out
#SBATCH --error=realtivetoisland_%j.err
#SBATCH --ntasks=20
#SBATCH --time=03:00:00
#SBATCH --cpus-per-task=1

for file in *_annot.txt; do
cut -d$'\t' -f7 $file > ${file/_annot.txt/_seven.txt}
done

for file in *_seven.txt; do
echo $file ' inter:'
awk 'BEGIN { FS = "\t" } {if ($1 ~ "inter") { count++ }} END { print count }' $file 
echo $file ' island:'
awk 'BEGIN { FS = "\t" } {if ($1 ~ "islands") { count++ }} END { print count }' $file 
echo $file ' shores:'
awk 'BEGIN { FS = "\t" } {if ($1 ~ "shores") { count++ }} END { print count }' $file 
echo $file ' shelves:'
awk 'BEGIN { FS = "\t" } {if ($1 ~ "shelves") { count++ }} END { print count }' $file 
echo $file ' slash:'
awk 'BEGIN { FS = "\t" } {if ($1 ~ "/") { count++ }} END { print count }' $file 
echo $file ' slash:'
awk 'BEGIN { FS = "\t" } {if ($1 ~ ",") { count++ }} END { print count }' $file 
echo $file ' total:'
wc -l $file
done