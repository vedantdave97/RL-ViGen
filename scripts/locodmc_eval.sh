task_name=('unitree_stand') # TwoArmPegInHole Door Lift
frames=1000000
# feature_dim=256
# sgqn_quantile=0.93
# aux_lr=8e-5
action_repeat=2
feature_dim=256
save_snapshot=False
use_wandb=False
nstep=3
export MODEL_DIR='/home/vedant/RL-ViGen/exp_local/2024.02.15/svea/144059_action_repeat=2,env=dmc,num_train_frames=1001000,save_snapshot=True,seed=3,task=unitree_stand,use_tb=False,use_wandb=False'


CUDA_VISIBLE_DEVICES=0  python locodmc_eval.py \
              task=${task_name} \
              seed=2 \
              action_repeat=${action_repeat} \
              use_wandb=${use_wandb} \
              use_tb=False \
              num_train_frames=${frames} \
              save_snapshot=${save_snapshot} \
              save_video=True \
              feature_dim=${feature_dim} \
              nstep=${nstep} \
              wandb_group="loco_svea"