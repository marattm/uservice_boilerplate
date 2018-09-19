#!/bin/bash

# run

docker-compose -f docker-compose.yml \
  run users python manage.py test