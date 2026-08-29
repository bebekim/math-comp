.PHONY: install lab kernel clean

VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

install:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	$(MAKE) kernel

kernel:
	$(PYTHON) -m ipykernel install --user --name math-comp --display-name "math-comp (sympy)"

lab:
	$(VENV)/bin/jupyter lab --notebook-dir=workspace

clean:
	rm -rf $(VENV)
	rm -rf workspace/.ipynb_checkpoints
