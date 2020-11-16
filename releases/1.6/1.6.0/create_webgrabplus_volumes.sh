#!/bin/bash

DIRNAME="$(dirname $(pwd))"
docker volume create --driver local \
    --opt type=none \
    --opt device=$DIRNAME/epg_config \
    --opt o=bind webgrabplus_config

docker volume create --driver local \
    --opt type=none \
    --opt device=$DIRNAME/epg_data \
    --opt o=bind webgrabplus_data
