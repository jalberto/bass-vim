# Installing

    cd ~
    git clone git://github.com/jalberto/bass-vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

# Upgrading all bundled plugins

    git submodule foreach git pull origin master
