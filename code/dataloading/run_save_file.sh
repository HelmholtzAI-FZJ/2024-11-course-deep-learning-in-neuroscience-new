#!/bin/bash -x

#SBATCH --nodes=1          
#SBATCH --gres=gpu:1     
#SBATCH --ntasks-per-node=1  
#SBATCH --cpus-per-task=128
#SBATCH --time=10:00:00
#SBATCH --partition=dc-gpu
#SBATCH --account=training2441
#SBATCH --output=%j.out
#SBATCH --error=%j.err

#SBATCH --reservation=training2441_day2

export SRUN_CPUS_PER_TASK="$SLURM_CPUS_PER_TASK"
source $HOME/course/sc_venv_template/activate.sh

mkdir -p "/p/scratch/training2441/$USER"

time srun python save_imagenet_files.py  --dset_type "h5" --target_folder "/p/scratch/training2441/$USER"