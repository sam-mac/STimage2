#!/bin/bash
# srun --cpus-per-task=4 --mem-per-cpu=8G --partition=gpu --gres=gpu:tesla:1 --pty bash -l
srun --cpus-per-task=8 --mem=50000 --partition=gpu --gres=gpu:tesla-smx2:1 --pty bash -l
