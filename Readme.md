# Installing

    cd ~
    git clone git://github.com/jalberto/bass-vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    vim +PluginInstall +qall

# Upgrading all bundled plugins

    vim +PluginUpdate +qall

# Misc

For correct tag generation in ruby use:

    gem install gem-ripper-tags
    gem ripper

Or

    gem install gem-ctags
    gem ctags

Add to top of ~/.rvm/gemsets/global.gems so it will be automagic
