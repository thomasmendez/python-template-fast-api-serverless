SHELL := /bin/bash

install: # @HELP python install project packages
install:
	pip install -r requirements.txt

env-windows: # @HELP python make virtualenv locally windows
env-windows:
	py -m pip install --user virtualenv
	py -m venv env

env-mac: # @HELP python make virtualenv locally mac
env-mac:
	python3 -m pip install --user virtualenv
	python3 -m venv env

serve: # @HELP python run locally
serve:
	uvicorn app.main:app --reload

test: # @HELP python run application test
test:
	python test ./... -count=1 -v

# build: # @HELP build application binary and place in bin directory
# build:
# 	cd env/lib/python3.7/site-packages/
# 	zip -r9 ../../../../function.zip .
# 	cd ../../../../
# 	zip -g ./function.zip -r app