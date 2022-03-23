module load samtools R java qualimap
picard="java -Xmx24G -jar /apps/PICARD/2.24.0/bin/picard.jar"
genome=/slgpfs/projects/cli50/data/genome/ENSEMBL.homo_sapiens.release-83/


#idib57898@sllogin2:/slgpfs/projects/idib57/GA_001_21_Parkinson> test=hola.txt
#idib57898@sllogin2:/slgpfs/projects/idib57/GA_001_21_Parkinson> echo $test
#hola.txt
#idib57898@sllogin2:/slgpfs/projects/idib57/GA_001_21_Parkinson> echo ${test/.txt/}
#hola
#idib57898@sllogin2:/slgpfs/projects/idib57/GA_001_21_Parkinson> echo ${test/.txt/.pdf}
#hola.pdf


bam=$1 
nameHeader=${bam/.bam/}


samtools sort bam/$bam -o bam/$bam.s -@ 3 -T QC/$nameHeader

mv bam/$bam.s bam/$bam

samtools index bam/$bam

$picard MarkDuplicates -I bam/$bam -O bam_nodup/$nameHeader.bam -M QC/$nameHeader.marked_dup_metrics.txt

$picard CollectAlignmentSummaryMetrics -I bam/$bam -R $genome -O QC/$nameHeader.AlignmentSummaryMetrics.txt

$picard QualityScoreDistribution -I bam/$bam -O QC/$nameHeader.QualityScoreDistribution.txt -CHART QC/$nameHeader.qual_score_dist.pdf

samtools idxstats bam/$bam > QC/$nameHeader.idxstats.txt

samtools flagstat --threads 50 bam/$bam > QC/$nameHeader.flagstat.txt

qualimap bamqc -nt 48 -bam bam/$bam -c -gd HUMAN - hg38 -outdir QC/$nameHeader -sd --java-mem-size=48G