VENV = .venvs/platform
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

.PHONY: install upgrade check clean

# 1. 还原逻辑：直接使用快照
install: 
	@if [ ! -f requirements.txt ]; then \
		echo "Error: No requirements.txt file found"; exit 1; \
	fi
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	echo "Installing from requirements.txt using constraints.txt..."
	$(PIP) install -r requirements.txt -c constraints.txt
	touch $(VENV)/bin/activate

# 2. 升级逻辑：主平台更新并产生新快照
upgrade:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	$(PIP) freeze > constraints.txt
	touch $(VENV)/bin/activate
	@echo "Platform updated. Recipe updated: requirements.txt & constraints.txt"

check:
	$(PYTHON) -c "import sympy; import numpy; import scipy; import matplotlib; import control; print('All core packages imported successfully.')"
	$(PYTHON) -m pytest --version

clean:
	rm -rf $(VENV)
