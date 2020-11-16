#!/bin/bash
NUM_SONDA=1
# Num_sonda can be passed as first argument if it exists and it is an integer
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi
# Exporting environment variables
ROOT_FOLDER=$(dirname "$(pwd)")
source config_docker
export API_PORT=$(($INIT_API_PORT+2*$NUM_SONDA))
export NUXT_PORT=$(($INIT_WEB_PORT+$NUM_SONDA))
export DB_PORT=$(($INIT_DB_PORT+$NUM_SONDA))
export NUXT_HOST="0.0.0.0"
export SHARED_FOLDER=$ROOT_FOLDER/tmp/docker_volume_folder_${NUM_SONDA}
rm -rf ${SHARED_FOLDER}
docker rmi $(docker images -f "dangling=true" -q)
docker rm -f ${API_PORT}_sonda_1 ${API_PORT}_websonda_1
mkdir $ROOT_FOLDER/tmp && mkdir ${SHARED_FOLDER}
docker-compose -f $ROOT_FOLDER/docker/docker-compose-dev.yaml -p ${API_PORT} build
docker-compose -f $ROOT_FOLDER/docker/docker-compose-dev.yaml -p ${API_PORT} up -d
