#!/bin/sh

ask() {
    read -p "$1 [yN]: " yn
    if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
        return 0
    fi
    return 1
}

check_installed() {
    printf " %s: " $1
    if command -v $1 >/dev/null 2>&1; then
        echo "installed!"
    else
        echo "not installed!"
        exit 1
    fi
}

# Create a link named $2 to file $1.
# Overwrites existing links.
# Overwrites all other files only on user confirmatio
create_link() {
    file=$1
    link_name=$2

    printf " Link: %s -> %s\n" $link_name $file

    if [ -h $link_name ]; then # is a symbolic link
        rm $link_name
    elif [ -e $link_name ]; then # other file exists
        if ask " File \"$link_name\" exists! Do you want to overwrite it? "; then
            if [ -d $link_name ]; then
                rm -r $link_name
            else
                rm $link_name
            fi
        else
            return
        fi
    fi

    ln -s $file $link_name
}

download_plug_vim() {
    file_path=$1

    printf "Downloading plug.vim ...\t"
    if [ -e $file_path ]; then
        echo "already downloaded!"
        return
    fi

    if curl -sfLo $file_path --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
    then
        echo "downloaded!"
    else
        echo "failed!"
        exit 1
    fi
}

##### MAIN #####

echo "Checking installs"
check_installed vim
check_installed zsh
echo

SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo "Creating links"
create_link $SCRIPT_DIR/latexmkrc ~/.latexmkrc
create_link $SCRIPT_DIR/tmux.conf ~/.tmux.conf
create_link $SCRIPT_DIR/vim ~/.vim
create_link $SCRIPT_DIR/vim/vimrc ~/.vimrc
create_link $SCRIPT_DIR/zsh ~/.zsh
create_link $SCRIPT_DIR/zsh/zprofile ~/.zprofile
create_link $SCRIPT_DIR/zsh/zshenv ~/.zshenv
create_link $SCRIPT_DIR/zsh/zshrc ~/.zshrc
echo

echo "Creating folders"
echo " Folder: ~/.vimundo"
[ ! -d ~/.vimundo ] && mkdir ~/.vimundo
echo

download_plug_vim $SCRIPT_DIR/vim/autoload/plug.vim
echo

printf "Installing Vim plugins\n"

vim_install_type=vim/install_type.vim
if [ ! -e  $vim_install_type ]; then
    if ask " Install all vim plugins?"; then
        echo "let g:isCompleteInstall = 1" > $vim_install_type
    else
        echo "let g:isCompleteInstall = 0" > $vim_install_type
    fi
fi
vim +PlugInstall +sleep4 +qa
echo

echo "Finished!"

