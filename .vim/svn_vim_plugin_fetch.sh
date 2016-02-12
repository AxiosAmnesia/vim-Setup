#!/usr/bin/bash

if [ ! -d '~/.vim' ]; then
	mkdir ~/.vim/
	echo ".vim dir made.\n"
else
	echo ".vim dir found.\n"
fi

wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
if [ -d '~/.vim/autoload/' ]; then
	mv pathogen.vim ~/.vim/autoload/pathogen.vim
else
	mkdir ~/.vim/autoload/
	mv pathogen.vim ~/.vim/autoload/pathogen.vim
fi

wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
if [ ! -d '~/.vim/colors' ]; then
	mkdir ~/.vim/colors
	mv solarized.vim ~/.vim/colors/solarized.vim
	echo ".vim/colors made."
else
	mv solarized.vim ~/.vim/colors/solarized.vim
	echo ".vim/colors found."
fi

if [ ! -d '~/.vim/bundle/' ]; then
	mkdir ~/.vim/bundle
	echo ".vim/bundle dir made.\n"
else
	echo ".vim/bundle dir found.\n"
fi

if [ ! -d '~/.vim/after/' ]; then
	mkdir ~/.vim/after
	echo ".vim/after dir made."
else
	echo ".vim/after found."
fi

if [ ! -d '~/.vim/after/ftplugin' ]; then
	mkdir ~/.vim/after/ftplugin
	echo ".vim/after/ftplugin made."
else
	echo ".vim/after/ftplugin found."
fi



echo "Adding ftplugin file extras\n"
echo "setlocal shiftwidth=2\nsetlocal tabstop=2" >> ~/.vim/after/ftplugin/css.vim
echo "setlocal shiftwidth=2\nsetlocal tabstop=2" >> ~/.vim/after/ftplugin/html.vim
echo "setlocal shiftwidth=2\nsetlocal tabstop=2" >> ~/.vim/after/ftplugin/js.vim
echo "setlocal shiftwidth=2\nsetlocal tabstop=2" >> ~/.vim/after/ftplugin/php.vim

echo "Adding color support to .bashrc\n"
echo "export TERM=xterm-256color\n" >> ~/.bashrc

echo "fetching plugin data.\n"

mkdir ~/.vim/bundle/lightline.vim
svn checkout https://github.com/itchyny/lightline.vim/trunk ~/.vim/bundle/lightline.vim

mkdir ~/.vim/bundle/neocomplcache.vim
svn checkout https://github.com/Shougo/neocomplcache.vim.git/trunk ~/.vim/bundle/neocomplcache.vim

mkdir ~/.vim/bundle/nerdtree
svn checkout https://github.com/scrooloose/nerdtree/trunk ~/.vim/bundle/nerdtree

mkdir ~/.vim/bundle/undotree
svn checkout https://github.com/mbbill/undotree/trunk ~/.vim/bundle/undotree

mkdir ~/.vim/bundle/vim-autoclose
svn checkout https://github.com/Townk/vim-autoclose.git/trunk ~/.vim/bundle/vim-autoclose

mkdir ~/.vim/bundle/vim-sensible
svn checkout https://github.com/tpope/vim-sensible/trunk ~/.vim/bundle/vim-sensible

mkdir ~/.vim/bundle/vim-surround
svn checkout https://github.com/tpope/vim-surround/trunk ~/.vim/bundle/vim-surround
