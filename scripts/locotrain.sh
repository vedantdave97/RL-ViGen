task_name=unitree_stand
frames=1001000
feature_dim=50
sgqn_quantile=0.93
action_repeat=2
aux_lr=8e-5
env=dmc

CUDA_VISIBLE_DEVICES=0 python train.py \
              task=${task_name} \
              env=${env} \
              seed=3 \
              action_repeat=${action_repeat} \
              use_tb=False \
              num_train_frames=${frames} \
              save_snapshot=True \
              use_wandb=False
