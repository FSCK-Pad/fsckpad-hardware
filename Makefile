# Author:
#      Justin Payne


.PHONY: help
PATH := $(HOME)/Documents/OpenSCAD/libraries/NopSCADLib/scripts:$(PATH)

SRCDIR    = scad
SOURCES  := $(wildcard $(SRCDIR)/*.scad)

usage: 
	@echo "Usage: make [target]"
	@echo 
	@echo "Targets:"

help: usage ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

init: ## initialize and pull any submodules
	git submodule init
	git submodule update

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

install-dev: ## Use Brew to install OpenSCAD, NopSCADLib, and its Python dependencies
	brew install openscad imagemagick kicad
	python -m pip install colorama codespell markdown toolmaster-of-brainerd
	cd ~/Documents/OpenSCAD/libraries
	git clone https://github.com/nophead/NopSCADlib.git

enclosure: ## Create a SCAD definition for the board.
	tob fsckpad-hardware/fsckpad-hardware.kicad_pcb -o scad/fsckpad_board.scad