mkdir -p coverage

for i in $(cat single_cell_list_bam.txt); do
    cell=$(echo ${i} | rev | cut -f 1 -d/ | rev)
    coverageBed -a mm10_genome_5k_window_nobl.bed -b ${i} | awk '$5>0' | cut -f 4,5 > coverage/${cell%.bam}.txt
done
