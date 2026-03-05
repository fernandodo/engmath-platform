VENV = .venvs/platform
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

.PHONY: install upgrade check clean

# 1. Replicate Environment: Rebuild strictly from local snapshots (requirements.txt & constraints.txt)
install: 
	@if [ ! -f requirements.txt ] || [ ! -f constraints.txt ]; then \
		echo "Error: Local snapshot files not found (requirements.txt or constraints.txt)"; \
		exit 1; \
	fi
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	@echo "Replicating environment from local snapshots..."
	$(PIP) install -r requirements.txt -c constraints.txt
	touch $(VENV)/bin/activate

# 2. Upgrade Platform: Update to latest versions and refresh the global recipe (constraints.txt)
upgrade:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	$(PIP) freeze > constraints.txt
	touch $(VENV)/bin/activate
	@echo "Platform upgraded. Global recipe refreshed."

check:
	$(PYTHON) -c "import sympy; import numpy; import scipy; import matplotlib; import control; print('Core packages imported successfully.')"
	$(PYTHON) -m pytest --version

clean:
	rm -rf $(VENV)
