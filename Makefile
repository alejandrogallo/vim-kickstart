all: plugins options 
options: 
	python my_options.py
plugins:
	bash vim-kickstart.sh
clean:
	-rm *.pyc
