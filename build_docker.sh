#!/bin/sh

docker build -t dactyl-keyboard -f docker/Dockerfile .
docker run --name DM-run -d -v "$(pwd)/src:/app/src" -v "$(pwd)/things:/app/things"  dactyl-keyboard python3 -i dactyl_manuform.py
docker run --name DM-config -d -v "$(pwd)/src:/app/src" -v "$(pwd)/things:/app/things" dactyl-keyboard python3 -i generate_configuration.py
docker run --name DM-shell -d -ti -v "$(pwd)/src:/app/src" -v "$(pwd)/things:/app/things"  dactyl-keyboard
