#!/bin/bash
NUM_SONDA=2
# Num_sonda can be passed as first argument if it exists and it is an integer
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi
source config_docker
export API_PORT=$(($INIT_API_PORT+2*$NUM_SONDA))
export WEB_PORT=$(($INIT_WEB_PORT+$NUM_SONDA))
export DB_PORT=$(($INIT_DB_PORT+$NUM_SONDA))
export SHARED_FOLDER=docker_volume_folder_${NUM_SONDA}
mkdir ${SHARED_FOLDER}
docker-compose -f docker-swarm-monitored.yaml up
