#!/bin/bash

#BSUB -L /bin/bash
#BSUB -J Extraction_RSII
#BSUB -q priority 

## prepare directory

# define working directory for user
work_dir=/scratch/beegfs/weekly/$USER
# create working directory for MinION extraction
mkdir -p $work_dir/lambda_RSII/h5/
# create links to the raw sequencing files
ln -s /scratch/beegfs/monthly/SIB_long_read_workshop/RSII_lambda_reads/*.h5 $work_dir/lambda_RSII/h5/

## load pbh5tools for read extraction
module add UHTS/PacBio/pbh5tools/0.8.0

## extract reads 

# convert all fast5 reads to fastq
bash5tools.py $work_dir/lambda_RSII/h5/m140715_200214_42182_c100661412550000001823125411271451_s1_p0.bas.h5 --outFilePrefix $work_dir/lambda_RSII/RSII_LambdaSubreads --readType subreads --outType fastq

