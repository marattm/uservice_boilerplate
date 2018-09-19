#!/bin/bash

# deployment prod machine
docker-machine create --driver amazonec2 uservice-prod
docker-machine env uservice-prod
eval $(docker-machine env uservice-prod)
docker-machine ls
docker-machine active # update the active host
