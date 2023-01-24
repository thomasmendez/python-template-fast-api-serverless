SHELL := /bin/bash

install: # @HELP python install project packages
install:
	pip install -r requirements.txt

env: # @HELP python make virtualenv locally
env:
	py -m pip install --user virtualenv
	py -m venv env

serve: # @HELP python run locally
serve:
	uvicorn main:app --reload

test: # @HELP python run application test
test:
	python test ./... -count=1 -v

build: # @HELP build application binary and place in bin directory
build:
	cd env/Lib/site-packages/
	zip -r9 ../../../../function.zip .