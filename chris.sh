#! /usr/bin/bash
# TODO: Ask to install packages, auto-installing everything on my server is not the way...
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
elif [ $OS = "darwin21" ]; then
  echo "> All hail our Mac Overlords"
  INSTALL="brew install"
  if [[ ! `which brew` ]]; then
    echo "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
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
# TODO: Prompt user to install:
# LINUX
# i3blocks
# rofi
# OSX
# yabai
# skhd
if [[ ! `which direnv` ]]; then
  $INSTALL direnv
fi

if [[ ! `which zsh` ]]; then
  $INSTALL zsh
fi

# Install node
if [[ ! `which node` ]]; then
  echo "> installing node"
  # Needed to run COC
  # TODO: Remove once converted to LSP config from COC
  $INSTALL nodejs
fi

if [[ ! -d ".oh-my-zsh" ]]; then
  echo "> installing oh-my-zsh"
  echo "> you must `exit` once complete"
  `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  echo ">oh-my-zsh installed"
  `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
  echo ">pl10k installed"
  mv .zshrc.pre-oh-my-zsh .zshrc
fi

# Install neovim
echo "> Would you like to install the latest version of NeoVim? [y/n]"
read installNvim
if [[ $installNvim == 'y' ||  $installNvim == 'Y' ||  $installNvim == 'yes' ||  $installNvim == 'Yes' ]]; then
  if [[ $OS = "darwin21" ]]; then
    $INSTALL neovim
  else
    echo "> installing N E O V I M"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/bin/nvim
  fi
fi

# Install vim plugged
if [[ ! -d ".vim/autoload" ]]; then
  echo "> installing vim plugged"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ ! `which rg` ]]; then
  echo "> BEYBLADES LET IT RIIIIPPP"
  $INSTALL ripgrep
fi

# Install alacritty (optional, and I need to fix some bugs)
# echo "> Would you like to install Alacritty? [y/n]"
# read installAlacritty
# if [[ $installAlacritty == 'y' ||  $installAlacritty == 'Y' ||  $installAlacritty == 'yes' ||  $installAlacritty == 'Yes' ]]; then
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# git clone https://github.com/alacritty/alacritty.git
# cd alacritty

# Install tmux
if [[ ! `which tmux` ]]; then
  echo "> installing tmux"
  git clone https://github.com/tmux/tmux.git
  cd tmux
  sh autogen.sh
  ./configure && make
fi

# Install syncthing
if [[ ! `which syncthing` ]]; then
  echo "> installing syncthing"
  $INSTALL syncthing
fi

echo ">done"

