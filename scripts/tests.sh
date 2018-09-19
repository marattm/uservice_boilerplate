#!/bin/bash

# run tests

docker-compose -f docker-compose.yml \
  run users python manage.py test

docker-compose -f docker-compose.yml \
  run client npm test --verbose
