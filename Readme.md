# Installing

    cd ~
    git clone git://github.com/jalberto/bass-vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

# Upgrading all bundled plugins

    git submodule foreach git pull origin master

# Misc

For correct tag generation in ruby use:

    gem install gem-ripper-tags
    gem ripper

Or

    gem install gem-ctags
    gem ctags

Add to top of ~/.rvm/gemsets/global.gems so it will be automagic
