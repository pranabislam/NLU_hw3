#!/bin/bash
#SBATCH --job-name=roberta_hyperparameter_search
#SBATCH --open-mode=append
#SBATCH --output=/scratch/pfi203/%j_%x.out
#SBATCH --error=/scratch/pfi203/%j_%x.err
#SBATCH --export=ALL
#SBATCH --time=04:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=28G
#SBATCH -c 4

singularity exec --nv --overlay /scratch/pfi203/overlay-25GB-500K.ext3:ro /scratch/work/public/singularity/cuda10.1-cudnn7-devel-ubuntu18.04-20201207.sif /bin/bash -c "
source /ext3/env.sh
conda activate
python ./run_hyperparameter_search.py BoolQ
"