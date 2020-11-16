#!/bin/bash
# Num_sonda can be passed as first argument if it exists and it is an integer
NUM_SONDA=1
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi
echo $NUM_SONDA
source config_docker
export API_PORT=$(($INIT_API_PORT+2*$NUM_SONDA))
export NUXT_PORT=$(($INIT_WEB_PORT+$NUM_SONDA))
export DB_PORT=$(($INIT_DB_PORT+$NUM_SONDA))
export SHARED_FOLDER=../tmp/docker_volume_folder_${NUM_SONDA}
rm -rf ${SHARED_FOLDER}
docker rm -f ${API_PORT}_sonda
mkdir ../tmp && mkdir ${SHARED_FOLDER}
docker-compose -f ../docker/docker-compose-dev.yaml -p ${API_PORT} build sonda mongo
docker-compose -f ../docker/docker-compose-dev.yaml -p ${API_PORT} up sonda mongo

