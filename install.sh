#!/bin/bash

# 调试
set -e 

# 判断是否存在这个变量
if [ -z "$VIM_DIR" ]; then
    VIM_DIR=~/.vim
fi

# 判断是否存在 ~/.vim 目录
if [ -d "$VIM_DIR" ]; then
    echo "you'll need to remove $VIM_DIR if you want to install"
    exit
else
    echo "Creating a $VIM_DIR directory..."
    mkdir $VIM_DIR
fi

# 是否存在 .vimrc 文件或者 .vimrc 的链接
echo "Looking for an exist vim config..."
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "Fount ~/.vimrc;Backing up to ~/.vimrc.pre-vim"
    mv ~/.vimrc ~/.vimrc.pre-my-vim
fi

# 从 github 下载 .vimrc和bundles.vim 文件
echo "Cloning .vimrc file"
hash git >/dev/null 2>&1 && git clone https://github.com/huzhirong/vim.git $VIM_DIR || {
    echo "git not Installed"
    exit
}

# 判断在 ~/.vim 目录下是否有 bundle 目录，没有则建立
if [ ! -d "$VIM_DIR/bundle" ]; then
    echo "Creating a bundle directory..."
    mkdir -p $VIM_DIR/bundle
fi

# 判断在 ~/.vim 目录下是否有 plugin 目录，没有则建立
if [ ! -d "$VIM_DIR/plugin" ]; then
    echo "Creating a plugin directory..."
    mkdir -p $VIM_DIR/plugin
fi

# 判断在 ~/.vim 目录下是否有 colors 目录，没有则建立
if [ ! -d "$VIM_DIR/colors" ]; then
    echo "Creating a colors directory..."
    mkdir -p $VIM_DIR/colors
fi

# 判断在 ~/.vim 目录下是否有 syntax 目录，没有则建立
if [ ! -d "$VIM_DIR/syntax" ]; then
    echo "Creating a syntax directory..."
    mkdir -p $VIM_DIR/syntax
    echo "Done"
fi

# 把 ~/.vim/.vimrc 文件复制到 ~/.vimrc
if [ -f "$VIM_DIR/.vimrc" ]; then
    mv $VIM_DIR/.vimrc ~
fi

# 安装 vbundle 插件
if [ ! -d "$VIM_DIR/bundle/vundle" ]; then
    echo "Creating vundle..."
    git clone https://github.com/gmarik/vundle.git $VIM_DIR/bundle/vundle
    echo "Done"
fi

vim +BundleInstall +qall 2>/dev/null

echo "Finish, Enjoying"
