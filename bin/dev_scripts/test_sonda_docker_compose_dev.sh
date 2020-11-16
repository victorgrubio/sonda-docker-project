#!/bin/bash
NUM_SONDA=50
# Num_sonda can be passed as first argument if it exists and it is an integer
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi
echo $NUM_SONDA
# Exporting environment variables
source config_docker
export API_PORT=$(($INIT_API_PORT+2*$NUM_SONDA))
export NUXT_PORT=$(($INIT_WEB_PORT+$NUM_SONDA))
export DB_PORT=$(($INIT_DB_PORT+$NUM_SONDA))
export SHARED_FOLDER=../tmp/docker_volume_folder_${NUM_SONDA}
export NUXT_HOST="0.0.0.0"
rm -rf ${SHARED_FOLDER}
docker rm -f ${API_PORT}_sonda ${API_PORT}_sonda_tests_1
docker rmi $(docker images -f "dangling=true" -q)
mkdir ../tmp && mkdir ${SHARED_FOLDER}

docker-compose -f ../docker/docker-compose-sonda-test.yaml -p ${API_PORT} build
docker-compose -f ../docker/docker-compose-sonda-test.yaml -p ${API_PORT} up --abort-on-container-exit --exit-code-from sonda_tests

