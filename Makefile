SHELL := /bin/bash

.DEFAULT: help
help:
	@echo "make venv"
	@echo "       Make a python virtual enviroment in the cwd and install requirements"
	@echo "make datasets"
	@echo "       Convert all datasets into html files using dataset_rawdata.py. The html will be placed in a directory in the top level of this repo called html_charts"
	@echo "make clean"
	@echo "       Clean up matatika-dataset-to-html cloned repo, only used if there were errors during make datasets"


venv:
	pip install virtualenv
	python -m venv venv
	source venv/bin/activate && pip install matatika &&	pip install matatika-iplotter && pip install bios
datasets:
	git clone https://github.com/Matatika/matatika-dataset-to-html.git
	mv matatika-dataset-to-html/matatika_dataset_to_html.py bundle/analyze/datasets/
	source venv/bin/activate && python bundle/analyze/datasets/matatika_dataset_to_html.py --datasets bundle/analyze/datasets/ --rawdata rawdata/ || python bundle/analyze/datasets/matatika_dataset_to_html.py --datasets bundle/analyze/datasets/ --rawdata rawdata/
	rm -rf matatika-dataset-to-html
	rm bundle/analyze/datasets/matatika_dataset_to_html.py
clean:
	rm -rf matatika-dataset-to-html
	rm bundle/analyze/datasets/matatika_dataset_to_html.py
	