# Makefile to configure the environment and simplify launching notebooks

# Set up a virtual environment.
venv:
	python3 -m venv venv
	venv/bin/pip install --upgrade pip wheel setuptools pip-tools
	venv/bin/pip install -e .
	touch venv
	venv/bin/python3 -m ipykernel install --user --name=muon-data-env

.PHONY: clean
clean:
	rm -rf ./venv ./build ./muon_gnssr_data_product_intro.egg-info

# Launch jupyter notebooks
.PHONY: notebooks
notebooks: venv
	PYTHONPATH=${PYTHONPATH}:${PWD} venv/bin/jupyter notebook --notebook-dir=notebooks
