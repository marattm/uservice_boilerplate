#!/bin/bash


# Docker-Machine Developement Deploy

env=$1

if [[ "${env}" == "dev" ]]; then
  docker-machine create -d virtualbox uservice-dev
  docker-machine env uservice-dev
  eval $(docker-machine env uservice-dev)
  URL0='http://'
  export REACT_APP_USERS_SERVICE_URL=$URL0$(docker-machine ip uservice-dev)
  docker-compose -f docker-compose.yml up -d --build
  docker-compose -f docker-compose.yml \
    run users python manage.py recreate_db
  echo $URL0$(docker-machine ip uservice-dev)
elif [[ "${env}" == "prod" ]]; then
  key=$(python keygen.py 2>&1 >/dev/null)
  export SECRET_KEY=$key
  echo $key
  docker-machine create --driver amazonec2 --amazonec2-open-port 80 --amazonec2-region us-west-2 uservice-prod
  docker-machine env uservice-prod
  eval $(docker-machine env uservice-prod)
  URL1='http://ec2-'
  URL0='http://'
  URL2=".us-west-2.compute.amazonaws.com"
  # export REACT_APP_USERS_SERVICE_URL=$URL1$(docker-machine ip uservice-prod)$URL2
  export REACT_APP_USERS_SERVICE_URL=$URL0$(docker-machine ip uservice-prod)
  python3 services/swagger/spec-update.py $(docker-machine ip uservice-prod)
  docker-compose -f docker-compose-prod.yml up -d --build
  docker-compose -f docker-compose-prod.yml \
    run users python manage.py recreate_db
  echo $URL0$(docker-machine ip uservice-prod)  
elif [[ "${env}" == "stage" ]]; then
  export SECRET_KEY="secret"
  docker-machine create --driver amazonec2 --amazonec2-open-port 80 --amazonec2-region us-west-2 uservice-stage
  docker-machine env uservice-stage
  eval $(docker-machine env uservice-stage)
  URL0='http://'
  export REACT_APP_USERS_SERVICE_URL=$URL0$(docker-machine ip uservice-stage)
  python3 services/swagger/spec-update.py $(docker-machine ip uservice-stage)
  docker-compose -f Docker-compose-stage.yml up -d --build
  docker-compose -f Docker-compose-stage.yml \
    run users python manage.py recreate_db
  echo $URL0$(docker-machine ip uservice-stage)
else
  # Local Developement Deploy
  export REACT_APP_USERS_SERVICE_URL=http://121.0.0.1
  docker-compose -f docker-compose.yml up -d --build
  docker-compose -f docker-compose.yml \
    run users python manage.py recreate_db
  echo 127.0.0.1
fi