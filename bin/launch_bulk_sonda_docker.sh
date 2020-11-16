#!/bin/bash
NUM_SONDA=1
# Num_sonda can be passed as first argument if it exists and it is an integer
if ! [[ -z "$1" ]] && [[ $1 =~ ^[0-9]+$ ]]
  then
    NUM_SONDA=$1
fi
for i in $( eval echo {1..$NUM_SONDA} )
do
	echo "SONDA ${i}"
	# Exporting environment variables
	source config_docker
	export API_PORT=$(($INIT_API_PORT+2*$i))
	export NUXT_PORT=$(($INIT_WEB_PORT+$i))
	export DB_PORT=$(($INIT_DB_PORT+$i))
	export SHARED_FOLDER=../tmp/docker_volume_folder_${NUM_SONDA}
    export NUXT_HOST="0.0.0.0"
    export NUXT_PORT=$NUXT_PORT
	rm -rf ${SHARED_FOLDER}
	docker rmi $(docker images -f "dangling=true" -q)
	docker rm -f ${API_PORT}_sonda ${API_PORT}_websonda ${API_PORT}_mongo
	mkdir ../tmp && mkdir ${SHARED_FOLDER}
	docker-compose -f ../docker/docker-compose-dev.yaml -p ${API_PORT} up -d
        sleep 5
done
