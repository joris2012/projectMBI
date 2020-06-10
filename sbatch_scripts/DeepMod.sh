#!/bin/bash
#SBATCH -t 10:00:00
#SBATCH -c 16

#directory to run deepsignal
cd /home/atgm2002/project

#copy directory to TMPDIR
cp -r ./* $TMPDIR

#cd TMPDIR
cd $TMPDIR
ls -la

#Call methylation with DeepMod
python DeepMod/bin/DeepMod.py detect --wrkBase test1.0/ecoli_2kb_region/fast5_files/odw_genlab4209_20161213_FN_MN16303_sequencing_run_sample_id_32395_ch --Ref test1.0/ref.fa --FileID atgm2002_test1 --modfile DeepMod/train_mod/rnn_sinmodC_P100wd21_f7ne1u0_4/mod_train_sinmodC_P100wd21_f3ne1u0 --threads 15 --outFolder out_folder/test1.0

#See if succes
ls -la

#cp output back to output directory
cp -r $TMPDIR/* /home/atgm2002/project/out_folder
ls -la
