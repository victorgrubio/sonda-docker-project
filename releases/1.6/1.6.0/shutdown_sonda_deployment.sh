#!/bin/bash
NUM_SONDA=1
# Num_sonda can be passed as first argument if it exists and it is an integer
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi
# Exporting environment variables
source config_docker
export API_PORT=$(($INIT_API_PORT+2*$NUM_SONDA))
export SHARED_FOLDER=docker_volume_folder_${NUM_SONDA}
rm -rf ${SHARED_FOLDER}
docker rm -f ${API_PORT}_sonda_1 ${API_PORT}_websonda_1 ${API_PORT}_mongo_1
docker volume rm -f ${API_PORT}_videos
