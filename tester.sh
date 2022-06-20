#!/bin/bash
#SBATCH --job-name="tester"
#SBATCH --output=tester_%j.out
#SBATCH --error=tester_%j.err
#SBATCH --ntasks=20
#SBATCH --time=06:00:00
#SBATCH --cpus-per-task=1

echo 'funciona'
echo 'pval'
for file in *_pval.txt;do
uniq $file > ${file/_pval.txt/_uniqPval.txt}
echo $file
done

echo 'qval'
for file in *_qval.txt;do
uniq $file > ${file/_qval.txt/_uniqQval.txt}
echo $file
done

echo 'uniqPval'
for file in *_uniqPval.txt;do
cat $file | tr '\t' ',' > ${file/_uniqPval.txt/_uniqPval.com}
echo $file
done

echo 'uniqQval'
for file in *_uniqQval.txt;do
cat $file | tr '\t' ',' > ${file/_uniqQval.txt/_uniqQval.com}
echo $file
done

echo'remove uniq.txt'
rm *_uniqPval.txt
rm *_uniqQval.txt

echo  'sort'
for file in *.com;do
sort -u -t, -k2,3 $file > ${file/.com/.txt}
echo $file
done

mv *.txt example

echo 'moving to example...'
cd example

echo '1000 pval'
for file in *_uniqPval.txt; do
sort -nk22 $file > ${file/_uniqPval.txt/_Pone.csv}
echo $file
done

echo '1000 qval'
for file in *_uniqQval.txt; do
sort -nk23 $file > ${file/_uniqQval.txt/_Qone.csv}
echo $file
done

mv *_Qone.csv ../1000
mv *_Pone.csv ../1000

cd ../1000

echo 'trim to 1000'
for file in *;do
head -1000 $file > ${file/one.csv/val.csv}
echo $file
done

rm *one.csv