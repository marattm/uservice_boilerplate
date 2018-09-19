#!/bin/bash

# recreate db

docker-compose -f docker-compose.yml \
  run users python manage.py recreate_db
