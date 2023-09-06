#!/bin/bash
module load cuda/11.0.2.450
module load gnu7
module load openmpi3
module load anaconda/3.6
source activate /scratch/smp/uqsmac12/.conda/env/lit_torch_gp
# source activate /scratch/smp/uqsmac12/.conda/env/jax