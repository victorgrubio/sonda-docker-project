#!/bin/bash
NUM_SONDA=1
# Num_sonda can be passed as first argument if it exists and it is an integer
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi

source config_docker
export API_PORT=$(($INIT_API_PORT+2*$NUM_SONDA))
export NUXT_PORT=$(($INIT_WEB_PORT+$NUM_SONDA))
export DB_PORT=$(($INIT_DB_PORT+$NUM_SONDA))
export SHARED_FOLDER=docker_volume_folder_${NUM_SONDA}
export VIDEOMOS_DBCACHE_GB=$VIDEOMOS_DBCACHE_GB
mkdir ${SHARED_FOLDER}
mkdir ${API_PORT}_mongo
docker volume rm -f $API_PORT_videos
docker login
docker-compose -f docker-compose-release.yaml pull
docker-compose -f docker-compose-release.yaml -p ${API_PORT} up --no-build --no-recreate -d 
