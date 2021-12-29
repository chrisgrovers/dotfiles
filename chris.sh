#! /usr/bin/bash
echo ">My job here is done"

OS=$OSTYPE
echo ">Detected operating system: $OS"


echo ">setting install command"

if [ $OS = "linux-gnu" ]; then
  if [ -f "/etc/debian_version" ]; then
    echo ">doing debian things"
    INSTALL="sudo apt-get install"
  elif [ -f "etc/arch-release"]; then
    echo ">Arch linux detected"
    INSTALL="pacman -S"
  fi
fi
if [[ ! $INSTALL ]]; then
  echo ">OS Not supported"
  exit
fi


function set_up_git() {
  echo ">setup git"
  function config {
     /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
  }

  mkdir -p .config-backup
  config checkout
  if [ $? = 0 ]; then
    echo ">Checked out config.";
  else
    echo ">Backing up pre-existing dot files.";
    mv README.md .config-backup/README.md
    mv .bashrc .config-backup/.bashrc
    mv .gtkrc-2.0 .config-backup/.gtkrc-2.0
    config checkout 2>&1 | egrep "\s+\." | awk {"print $1"} | xargs -I{} mv {} .config-backup/{}
  fi;
  config checkout
  config config status.showUntrackedFiles no
}

set_up_git

if [[ ! `which curl` ]]; then 
  echo ">curl not found"
  $INSTALL curl
else
  echo ">Curl installed already"
fi


# Linux specific installs here
# if [ $OS = "linux-gnu" ]; then
# fi

if [[ ! `which direnv` ]]; then
  $INSTALL direnv
fi

if [[ ! `which zsh` ]]; then
  $INSTALL zsh
fi

if [[ ! -d ".oh-my-zsh" ]]; then
  echo "> installing oh-my-zsh"
  echo "> you must `exit` once complete"
  `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  echo ">oh-my-zsh installed"
  `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
  echo ">pl10k installed"
  mv .zshrc.pre-oh-my-zsh .zshrc
else
  echo ">oh-my-zsh detected"
fi

# Install neovim
echo "> Would you like to install the latest version of NeoVim? [y/n]"
read input
if [[ $input == 'y' ||  $input == 'Y' ||  $input == 'yes' ||  $input == 'Yes' ]]; then
  echo "> installing N E O V I M"
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv nvim.appimage /usr/bin/nvim
fi

# Install vim plugged
if [[ ! -d ".vim/autoloac" ]]; then
  echo "> installing vim plugged"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo ">done"

