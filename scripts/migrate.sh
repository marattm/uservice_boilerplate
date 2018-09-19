#!/bin/bash

docker-compose -f docker-compose.yml run users python manage.py db init
docker-compose -f docker-compose.yml run users python manage.py db migrate
docker-compose -f docker-compose.yml run users python manage.py db upgrade
