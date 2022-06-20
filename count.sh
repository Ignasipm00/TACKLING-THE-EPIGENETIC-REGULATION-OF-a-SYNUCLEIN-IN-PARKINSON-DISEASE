for file in *.bed; do
cut -d$'\t' -f1,2,3,4,7,26,62,63,64,65,66,67,68,69,70,71,72,73,74,75 $file > ${file/.bed/DAn.new}
done  

for file in *.bed; do
awk 'BEGIN {OFS="\t"}; {print $62,$63,$64,$65,$66,$67,$68,$69,$60,$61,$62,$63,$64,$65}' $file > ${file/.bed/_awk.tet}
done

#realtivetoisland
for file in *_annot.txt; do
echo $file ' inter:'
awk 'BEGIN { FS = "\t" } {if ($7 ~ "inter") { count++ }} END { print count }' $file 
echo $file ' island:'
awk 'BEGIN { FS = "\t" } {if ($7 ~ "island") { count++ }} END { print count }' $file 
echo $file ' shores:'
awk 'BEGIN { FS = "\t" } {if ($7 ~ "shores") { count++ }} END { print count }' $file 
echo $file ' shelves:'
awk 'BEGIN { FS = "\t" } {if ($7 ~ "shelves") { count++ }} END { print count }' $file 
echo $file ' more:'
awk 'BEGIN { FS = "\t" } {if ($7 ~ "/") { count++ }} END { print count }' $file 
echo $file ' total:'
wc -l $file
done

#typeofpromoter check
for file in *_annot.txt; do
echo $file ' promoter1:'
awk 'BEGIN { FS = "\t" } {if ($13 ~ "promoter1") { count++ }} END { print count }' $file 
echo $file ' promoter2:'
awk 'BEGIN { FS = "\t" } {if ($13 ~ "promoter2") { count++ }} END { print count }' $file 
echo $file ' promoter3:'
awk 'BEGIN { FS = "\t" } {if ($13 ~ "promoter3") { count++ }} END { print count }' $file 
echo $file ' promoter4:'
awk 'BEGIN { FS = "\t" } {if ($13 ~ "promoter4") { count++ }} END { print count }' $file 
echo $file ' undefined:'
awk 'BEGIN { FS = "\t" } {if ($13 ~ "undefined") { count++ }} END { print count }' $file 
echo $file ' total:'
wc -l $file
done

#relativetogene
for file in *_annot.txt; do
echo $file ' geneBody:'
awk 'BEGIN { FS = "\t" } {if ($14 ~ "geneBody") { count++ }} END { print count }' $file 
echo $file ' distalIntergenic:'
awk 'BEGIN { FS = "\t" } {if ($14 ~ "distalIntergenic") { count++ }} END { print count }' $file 
echo $file ' geneDownstream:'
awk 'BEGIN { FS = "\t" } {if ($14 ~ "geneDownstream") { count++ }} END { print count }' $file 
echo $file ' promoter:'
awk 'BEGIN { FS = "\t" } {if ($14 ~ "promoter") { count++ }} END { print count }' $file 
echo $file ' undefined:'
awk 'BEGIN { FS = "\t" } {if ($14 ~ "undefined") { count++ }} END { print count }' $file 
echo $file ' total:'
wc -l $file
done

#loactionwithingene
for file in *_annot.txt; do
echo $file ' intron:'
awk 'BEGIN { FS = "\t" } {if ($15 ~ "intron") { count++ }} END { print count }' $file 
echo $file ' exon:'
awk 'BEGIN { FS = "\t" } {if ($15 ~ "exon") { count++ }} END { print count }' $file 
echo $file ' intergenic:'
awk 'BEGIN { FS = "\t" } {if ($15 ~ "intergenic") { count++ }} END { print count }' $file 
echo $file ' undefined:'
awk 'BEGIN { FS = "\t" } {if ($15 ~ "undefined") { count++ }} END { print count }' $file 
echo $file ' total:'
wc -l $file
done


#relativetoORF check
for file in *_annot.txt; do
echo $file ' utr5:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "utr5") { count++ }} END { print count }' $file 
echo $file ' utr3:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "utr3") { count++ }} END { print count }' $file 
echo $file ' CDS:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "CDS") { count++ }} END { print count }' $file 
echo $file ' undefined:'
awk 'BEGIN { FS = "\t" } {if ($16 ~ "undefined") { count++ }} END { print count }' $file 
echo $file ' total:'
wc -l $file
done


