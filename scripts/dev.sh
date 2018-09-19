#!/bin/bash

# there is a problem with the dev env, there is some cross-origiin problem

# the issue is detailed in the issues.md

# Docker-Machine Developement Deploy

DEV = $1

if [ "$DEV" = "dev"]
then 
    docker-machine create -d virtualbox uservice-dev
    docker-machine env uservice-dev
    eval $(docker-machine env uservice-dev)
    URL0='http://'
    export REACT_APP_USERS_SERVICE_URL=$URL0$(docker-machine ip uservice-dev)
    docker-compose -f docker-compose.yml up -d --build
    docker-compose -f docker-compose.yml \
      run users python manage.py recreate_db
else
    # Local Developement Deploy
    export REACT_APP_USERS_SERVICE_URL=http://121.0.0.1
    export REACT_APP_TRAINERS_SERVICE_URL=http://121.0.0.1
    docker-compose -f docker-compose.yml up -d --build
    docker-compose -f docker-compose.yml run users python manage.py recreate_db
    docker-compose -f docker-compose.yml run trainers python manage.py recreate_db
fi
