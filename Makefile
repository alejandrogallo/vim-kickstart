
# # ############################################################################
#   All installs plugins locally and copies the repo .vimrc to the local one  # 
# ############################################################################# 


all: install-plugins update-local-vimrc 

clean:
	-rm *.pyc

update-local-vimrc:
	./src/update-local-vimrc.sh

update-repo-vimrc:
	./src/update-from-local-vimrc.sh

install-plugins:
	./src/install-plugins.sh

install-new-plugins:
	./src/update-local-vimrc.sh
	./src/install-plugins.sh
	./src/update-from-local-vimrc.sh

