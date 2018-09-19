# Command lines to run automated bash scripts.

spin_up_services:
	# Deploy all containers in the localhost with the development environment.
	sh ./scripts/deploy.sh

dev_env_deploy:
	# Deploy all containers inside a virtual machine with the developement environment.
	sh ./scripts/deploy.sh dev

stage_env_deploy:
	# Deploy all containers inside a virtual machine with the production environment.
	sh ./scripts/deploy.sh stage

prod_env_deploy:
	# Deploy all containers inside a EC2 virtual machine with the production environment.
	sh ./scripts/deploy.sh prod

clean:
	# Clean all containers.
	sh ./scripts/clean.sh

tests:
	# Tests all services.
	sh ./scripts/tests.sh

client-tests:
	# Test the client.
	sh ./scripts/tests-client.sh

users-tests:
	# Test the users services.
	sh ./scripts/tests-users.sh

flake:
	# Test the quality of code.
	sh ./scripts/flake.sh

migrate:
	# Migrate database.
	sh ./scripts/migrate.sh

coverage:
	# Code coverage.
	sh ./scripts/cov-users.sh

export:
	# Export some environment variables needed during the building phase.
	sh ./scripts/export.sh

keygen:
	# Create randomly a secret key.
	sh ./scripts/key-export.sh