.PHONY: install lab kernel clean

VENV := .venv
PYTHON := $(VENV)/bin/python

install:
	uv sync
	$(MAKE) kernel

kernel:
	$(PYTHON) -m ipykernel install --user --name math-comp --display-name "math-comp (sympy)"

lab:
	$(VENV)/bin/jupyter lab --notebook-dir=.

clean:
	rm -rf $(VENV)
	rm -rf workspace/.ipynb_checkpoints
