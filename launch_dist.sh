export NNODES=2
export MLP_WORKER_GPU=8

echo "MLP_WORKER_RACK_RANK_INDEX,"$MLP_WORKER_RACK_RANK_INDEX
echo "MLP_ROLE_INDEX,"$MLP_ROLE_INDEX
echo "RANK,"$RANK
echo "KUBERNETES_CONTAINER_RESOURCE_GPU,"$KUBERNETES_CONTAINER_RESOURCE_GPU
echo "MLP_WORKER_GPU,"$MLP_WORKER_GPU
echo "WORLD_SIZE,"$WORLD_SIZE
echo "MLP_WORKER_0_HOST,"$MLP_WORKER_0_HOST
echo "MLP_WORKER_0_PORT,"$MLP_WORKER_0_PORT

export NODE_RANK=${MLP_WORKER_RACK_RANK_INDEX:-${MLP_ROLE_INDEX:-${RANK:-0}}}

echo "NODE_RANK,"$NODE_RANK


export GPUS_PER_NODE=${MLP_WORKER_GPU:-${KUBERNETES_CONTAINER_RESOURCE_GPU:-4}}


export MASTER_ADDR=${MLP_WORKER_0_HOST:-${MASTER_ADDR:-127.0.0.1}}
export MASTER_PORT=${MLP_WORKER_0_PORT:-${MASTER_PORT:-1234}}

DISTRIBUTED_ARGS="
    --nproc_per_node $GPUS_PER_NODE \
    --nnodes $NNODES \
    --node_rank $NODE_RANK \
    --master_addr $MASTER_ADDR \
    --master_port $MASTER_PORT
"

#torchrun  $DISTRIBUTED_ARGS $MEGATRON_DIR/pretrain_gpt_audio.py

#python -m torch.distributed.launch --nproc_per_node=8 mini_rl_example.py 
