bedtools makewindows -g mm10.chrom.sizes -w $1 | awk 'BEGIN{OFS="\t"}{print $1, $2, $3, $1 "_" $2 "_" $3}'
