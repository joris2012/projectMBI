#!/bin/bash
#SBATCH -t 02:00:00
#SBATCH -c 16 

#directory to run nanopolish
cd /home/atgm2004/project/nanopolish/methylation_example

#copy directory to TMPDIR
cp -r ./* $TMPDIR

#cd TMPDIR
cd $TMPDIR
ls -la 

#Call methylation with nanopolish
conda install -c bioconda nanopolish
nanopolish call-methylation -t 8 -r albacore_output.fastq -b output.sorted.bam -g reference.fasta -w "chr20:4,000,000-10,000,000" > methylation_calls3.tsv

#See if succes
ls -la

#cp output back to output directory
cp -r $TMPDIR/* /home/atgm2004/project/nanopolish/output
ls -la
