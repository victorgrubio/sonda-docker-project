#!/bin/bash
docker node ls --format '{{.Hostname}}:{{.Self}}' |
  while IFS= read -r line
  do
    if [[ $line == *":true"* ]]; then
        IFS=':'
        #Read the split words into an array based on comma delimiter
        read -a splittedString <<< "$line"
        echo "$splittedString";
        break;
    fi
  done
  