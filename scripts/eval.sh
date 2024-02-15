save_snapshot=False
use_wandb=False
#env='carla'
#export MODEL_DIR='/home/vedant/RL-ViGen/exp_local/2024.02.15/114612_action_repeat=2,feature_dim=50,lr=1e-4,nstep=1,num_train_frames=1001000,save_snapshot=True,save_video=False,seed=3,task=carla,use_tb=False,use_wandb=False,wandb_group=carla'

env='robosuite'
export MODEL_DIR='/home/vedant/RL-ViGen/exp_local/2024.02.15/svea/150150_action_repeat=2,env=robosuite,feature_dim=50,num_train_frames=1001000,save_snapshot=True,save_video=False,seed=5,task=TwoArmPegInHole,use_tb=False,use_wandb=False'

if [ "$env" = "robosuite" ]; then
task_name='TwoArmPegInHole'
test_agent='test_svea'
action_repeat=1
CUDA_VISIBLE_DEVICES=0  python eval.py \
              env=${env} \
              task=${task_name} \
              model_dir=${model_dir} \
              seed=5 \
              action_repeat=${action_repeat} \
              use_wandb=${use_wandb} \
              use_tb=False \
              save_snapshot=${save_snapshot} \
              save_video=True \
              wandb_group=${test_agent}
elif [ "$env" = "habitat" ]; then
  test_agent='test_pieg_'
  action_repeat=2
  for ((i=1;i<11;i+=1))
  do
  CUDA_VISIBLE_DEVICES=7  python eval.py \
                env=${env} \
                task@_global_='habitat' \
                model_dir=${model_dir} \
                seed=3 \
                action_repeat=${action_repeat} \
                use_wandb=${use_wandb} \
                use_tb=False \
                save_video=False \
                save_snapshot=${save_snapshot} \
                wandb_group=${test_agent}$((i))
  done
elif [ "$env" = "carla" ]; then
task_name='carla'
wandb_group='test_carla'
action_repeat=2

CUDA_VISIBLE_DEVICES=0  python eval.py \
                                env=${env} \
                                task=${task_name} \
                                seed=3 \
                                action_repeat=${action_repeat} \
                                use_wandb=${use_wandb} \
                                use_tb=False \
                                save_snapshot=${save_snapshot} \
                                save_video=False \
                                wandb_group=${wandb_group}

fi