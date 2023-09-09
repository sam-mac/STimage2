#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 12
#SBATCH --mem=50000
#SBATCH -o jobfiles/out_%x_%j.txt
#SBATCH -e jobfiles/error_%x_%j.txt
#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla-smx2:1
# #SBATCH --gres=gpu:tesla:1

#SBATCH --job-name sam_test

# get tunneling info
XDG_RUNTIME_DIR=""
node=$(hostname -s)
user=$(whoami)
cluster="wiener.hpc.net"
port=4263

# print tunneling instructions jupyter-log
echo -e "
Hostname for the node: 
${node}

Command to create ssh tunnel:
ssh -N -f -L ${port}:${node}:${port} ${user}@${cluster}.uq.edu.au

Use a Browser on your local machine to go to:
localhost:${port}  (prefix w/ https:// if using password)
"
module load cuda/11.0.2.450
module load gnu7
module load openmpi3
module load anaconda/3.6
source activate /scratch/smp/uqsmac12/.conda/env/lit_torch_gp

PATH=/scratch/smp/uqsmac12/.conda/env/lit_torch_gp/bin:$PATH
jupyter notebook --no-browser --port=${port} --ip=${node}
