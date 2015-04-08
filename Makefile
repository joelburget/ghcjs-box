.PHONY: submodules

help:
	@echo "make up"

submodules:
	git submodule update --init --recursive

up: submodules
	vagrant up
