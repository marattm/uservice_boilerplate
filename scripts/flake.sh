#!/bin/bash

# flake running


docker-compose -f docker-compose.yml \
  run users flake8 project
