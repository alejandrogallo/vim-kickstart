VIM-KICKSTART
=============


## Usage ##

Just download the code :

```bash
git clone https://github.com/alejandrogallo/vim-kickstart.git
cd vim-kickstart
./vim-kickstart
```

I use mainly the package manager [Vundle](https://github.com/VundleVim/Vundle.vim).
If you use another one it should not be difficult to adapt the code to another one.



## Installing plugins ##

To install the plugins just type 

```bash
make install-plugins
```

Beware, that this command will overwrite your `.vimrc` configuration file, so back it up.

### Make rules ###

```bash
all: install-plugins update-local-vimrc 
clean:
update-local-vimrc:
update-repo-vimrc:
install-plugins:
install-new-plugins:
purge-local:
list:
reset-all: purge-local all
update-snippets:
  This just updates my custom snippets from another directory 
```

## Disclaimer ##

Be careful

