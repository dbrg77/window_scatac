# Window scATAC
A small workflow to divide genome into bins with defined sizes and get count matrix on top of that

## Preparation:

```
# get fetchChromSizes from ucsc: http://hgdownload.soe.ucsc.edu/admin/exe/, and run:

fetchChromSizes mm10 > mm10.chrom.sizes

# get mm10 black list from here:
https://sites.google.com/site/anshulkundaje/projects/blacklists

# install the latest bedtools:
https://bedtools.readthedocs.io/en/latest/
```

## Step 1: divide genomes into bins of defined size (5k as an sample).

`bash split_genome.sh > mm10_genome_5k_window.bed`


## Step 2: remove blacklisted regions.

`intersectBed -a mm10_genome_5k_window.bed -b mm10.blacklist.bed -v > mm10_genome_5k_window_nobl.bed`


## Step 3: create a txt file pointing to the location of the mapped single cell bam file.

```
# example of single_cell_list_bam.txt, one line per file:

$cat single_cell_list_bam.txt
/mnt/window_scatac/bam/mSp_rep9_177_f2q30.bam
/mnt/window_scatac/bam/mSp_rep9_304_f2q30.bam
/mnt/window_scatac/bam/mSp_rep9_373_f2q30.bam
```

## Step 4: get coverage output.

`bash get_coverage.sh`

This script simply uses `coverageBed` to get for each window, the number of reads falling into that window. Windows of no reads are not printed. All output files are put into a folder called `coverage`

## Step 5: collect the count matrix.

`python collect_count_matrix.py`

This python sript generate a window by cell count matrix. Each window has at least one read in at least one cell. You can start from here for the routine downstream analysis.