#!/bin/bash

# checkup dev


docker-compose -f docker-compose.yml up -d --build

docker-compose -f docker-compose.yml \
  run users python manage.py recreate_db

docker-compose -f docker-compose.yml \
  run users python manage.py test