#!/bin/bash

# run dev env machine

docker-machine create -d virtualbox uservice-dev
docker-machine env uservice-dev
eval $(docker-machine env uservice-dev)
docker-machine ls
docker-machine active
