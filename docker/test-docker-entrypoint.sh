#!/bin/bash
AI_PORT=$(( $API_PORT - 1 ))
./opt/wait-for-it.sh localhost:${AI_PORT} -t 0 --strict -- pytest -vv /opt/data_manager/tests

