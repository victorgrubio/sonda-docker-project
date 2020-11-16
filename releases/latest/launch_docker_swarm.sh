#!/bin/bash
NUM_SONDA=100
# Num_sonda can be passed as first argument if it exists and it is an integer
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi
source config_docker
export API_PORT=$(($INIT_API_PORT+2*$NUM_SONDA))
export NUXT_PORT=$(($INIT_WEB_PORT+$NUM_SONDA))
export DB_PORT=$(($INIT_DB_PORT+$NUM_SONDA))
export NUXT_HOST="0.0.0.0"
export VIDEOMOS_DBCACHE_GB=$VIDEOMOS_DBCACHE_GB
export NODE_HOSTNAME=$(./get_current_node_hostname.sh)

docker stack deploy --with-registry-auth --compose-file=docker-compose-swarm.yml ${NODE_HOSTNAME}_sonda_${API_PORT}

