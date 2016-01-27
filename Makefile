
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

purge-local:
	rm -rf ~/.vim/bundle/*
	echo "" > ~/.vimrc

list:
	./src/list-plugins.sh

reset-all: purge-local all

update-plugins:
	vim +PluginUpdate

push-changes:
	git commit -am "Normal update"
	git push origin master

update-snippets:
	@if ! test -d $(HOME)/.vim/UltiSnips; then \
		mkdir $(HOME)/.vim/UltiSnips; \
		cd $(HOME)/.vim/UltiSnips; \
		git clone https://alejandrogallo@github.com/alejandrogallo/vim-snippets UltiSnips; \
	else \
		git pull; \
	fi
	cd -
		
		
