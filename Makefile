.PHONY: help submodules up

help:
	@echo "make up"

submodules:
	git submodule update --init --recursive

up: submodules
	vagrant up

# Used to package this box for uploading to atlas.hashicorp.com.
# This is rarely used and probably only by Joel.
package.box:
	vagrant package
