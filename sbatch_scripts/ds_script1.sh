#!/bin/bash
#SBATCH -t 02:00:00
#SBATCH -c 16 

#directory to run deepsignal
cd /home/atgm2004/project/deepsignal2/deepsignal

#copy directory to TMPDIR
cp -r ./* $TMPDIR

#cd TMPDIR
cd $TMPDIR
ls -la 

#Call methylation with deepsignal
deepsignal call_mods --input_path fast5s.al/ --model_path model.CpG.R9.4_1D.human_hx1.bn17.sn360.v0.1.7+/bn_17.sn_360.epoch_9.ckpt --result_file fast5s.al.CpG.call_mods.tsv --reference_path GCF_000146045.2_R64_genomic.fna --corrected_group RawGenomeCorrected_001 --nproc 10 --is_gpu no

#See if succes
ls -la

#cp output back to output directory
cp -r $TMPDIR/* /home/atgm2004/project/deepsignal2/output
ls -la
