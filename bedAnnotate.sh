
awk 'BEGIN {OFS="\t"}; {print $1,$2,$3}'

for bedd in *.bedd; do

awk 'BEGIN {OFS="\t"}; {print $1,$2,$3}' $bedd  > ../methyl_diff/$bedd
done

for bedd in *.bedd; do
intersectbed -header -a $bedd -b /slgpfs/projects/idib57/data/850K/GPL21145-48548.bed -loj | awk 'BEGIN {OFS="\t"}; {print $1,$2,$3,$7}' > "$bedd"s
mv "$bedd"s $bedd
done


for bedd in *.bedd; do
bedtools sort -i $bedd   > "$bedd"s
mv "$bedd"s $bedd
done


for bedd in *.bedd; do
bedtools merge -i $bedd -o collapse -c 4   > "$bedd"s
mv "$bedd"s $bedd
done

bedd=(*.bedd)
csv=(*.csv)

for((i=0;i<${#bedd[@]};i++))
do

intersectbedd -header -a ${bedd[$i]}  -b ${csv[$i]} -loj | awk 'BEGIN {OFS="\t"}; {print $1,$2,$3,$4,$8,$9,$10}'  > "${bedd[$i]}"s
mv "${bedd[$i]}"s ${bedd[$i]}
done




