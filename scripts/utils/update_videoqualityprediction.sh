#!/bin/bash
cd ../video-quality-prediction/
rm -rf dist/
./compile_videoqualityprediction.sh
cd ..
./start_docker_compose_dev.sh