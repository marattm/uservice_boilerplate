#!/bin/bash

# users code coverage

docker-compose -f docker-compose.yml \
  run users python manage.py cov