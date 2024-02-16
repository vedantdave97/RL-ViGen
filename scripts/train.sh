#easy_task_list=('TwoArmPegInHole')
#frames=1001000
#feature_dim=50
#sgqn_quantile=0.93
#action_repeat=2
#aux_lr=8e-5
#env=robosuite

#for task_name in ${easy_task_list[@]};
#do
#	CUDA_VISIBLE_DEVICES=0  python train.py \
#								env=${env} \
#								task=${task_name} \
#								seed=5 \
#								action_repeat=${action_repeat} \
#								use_wandb=False \
#								use_tb=False \
#								num_train_frames=${frames} \
#								save_snapshot=True \
#								save_video=False \
#								feature_dim=${feature_dim}
## 							  agent.sgqn_quantile=${sgqn_quantile} \
## 							  agent.aux_lr=${aux_lr}
#done

easy_task_list=('cheetah_run' 'walker_walk' 'quadruped_run' 'reacher_easy' 'finger_spin' 'cartpole_swingup')
frames=1001000
feature_dim=50
sgqn_quantile=0.93
action_repeat=2
aux_lr=8e-5
env=dmc

for task_name in ${easy_task_list[@]};
do
	CUDA_VISIBLE_DEVICES=0  python train.py \
								env=${env} \
								task=${task_name} \
								seed=5 \
								action_repeat=${action_repeat} \
								use_wandb=False \
								use_tb=False \
								num_train_frames=${frames} \
								save_snapshot=True \
								save_video=False \
								feature_dim=${feature_dim}
# 							  agent.sgqn_quantile=${sgqn_quantile} \
# 							  agent.aux_lr=${aux_lr}
done