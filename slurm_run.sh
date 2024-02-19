#!/bin/bash

#SBATCH -n 1
#SBATCH --cpus-per-task=8
#SBATCH --gpus=1
# tmp tmp tmp SBATCH --gres=gpumem:49152m
#SBATCH --gres=gpumem:24576m
#SBATCH --time=96:00:00
#SBATCH --mem-per-cpu=16384m
#SBATCH --output="test_kitti.out"
#SBATCH --job-name=test_kitti
# tmp tmp tmp SBATCH -d afterok:46733362

#131072 SBATCH --mem-per-cpu=

# python train_ransac.py keytf_spnn_megadepth_fullvalset_wposeloss --conf configs/superpoint_keytf+nearestneighbor_megadepth_e2e_b1.yaml -nf 1000 -tr 1 -bs 1\
#         -lr 1e-5 -t 1.5 -sam 2 -fmat 0 -w0 1 -w2 1 -sid spnn -e 67 -p 0 -topk 1 -pth /cluster/home/shikim/cvgproj/fdsfmdata/diff_ransac_data/data -ransac 2 -ep 2500

source /cluster/project/cvg/students/shikim/pytorch-deepFEPE/deepfepe/bin/activate
python deepFEPE/train_good.py train_good deepFEPE/configs/kitti_corr_baseline.yaml test_kitti --eval