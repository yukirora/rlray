
echo "MLP_WORKER_RACK_RANK_INDEX,"$MLP_WORKER_RACK_RANK_INDEX
echo "MLP_ROLE_INDEX,"$MLP_ROLE_INDEX
echo "RANK,"$RANK
echo "KUBERNETES_CONTAINER_RESOURCE_GPU,"$KUBERNETES_CONTAINER_RESOURCE_GPU
echo "MLP_WORKER_GPU,"$MLP_WORKER_GPU
echo "WORLD_SIZE,"$WORLD_SIZE
echo "MLP_WORKER_0_HOST,"$MLP_WORKER_0_HOST
echo "MLP_WORKER_0_PORT,"$MLP_WORKER_0_PORT

#torchrun --nproc_per_node 8 --nnodes 1  $DISTRIBUTED_ARGS $MEGATRON_DIR/pretrain_gpt_audio.py

#python -m torch.distributed.launch --nproc_per_node=8 mini_rl_example.py 
