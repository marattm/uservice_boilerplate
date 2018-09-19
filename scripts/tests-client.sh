#!/bin/bash

# run

docker-compose -f docker-compose.yml \
  run client npm test --verbose
