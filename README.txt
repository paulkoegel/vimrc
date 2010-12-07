VIM CONFIG README:

Install Log
===========

cf.screencast:
  http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

* moved .vimrc and .gvimrc to .vim and renamed them to vimrc and gvimrc
* create symbolic links ~/.vimrc and ~/.gvimrc
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
* cd .vim
* git init
* git add .
* git commit -m "initial commit"
* git remote add origin git@github.com:paulwittmann/vimrc.git
* git push origin master
