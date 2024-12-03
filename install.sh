#!/usr/bin/env bash

# Might as well ask for password up-front, right?
echo "Starting install script, please grant me sudo access..."
sudo -v

exists() {
  type "$1" &> /dev/null;
}

if [ "$(uname)" == "Darwin" ]; then
  if exists brew; then
    echo "Homebrew is installed!"
  else
    echo "Homebrew is not installed, installing now"
    echo "This may take a while"
    echo "Homebrew requires osx command lines tools, please download xcode first"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
fi

packages=(
  "curl"
  "git"
  "gcc"
  "python"
  "tmux"
  "vifm"
  #"lazygit"
  #"thefuck"
  #"delta"
  "ripgrep" #binary is "rg" so will try to install every time :shrug:
)


install_missing_packages() {
  for p in "${packages[@]}"; do
    if exists $p; then
      echo "$p is installed"
    else
      echo "$p is not installed"
      # Detect the platform (similar to $OSTYPE)
      case "$(uname)" in
        'Linux')
          sudo apt install "$p" || echo "$p failed to install"
          ;;
        'Darwin')
          brew install "$p" || echo "$p failed to install"
          ;;
        *) ;;
      esac
      echo "---------------------------------------------------------"
      echo "Done "
      echo "---------------------------------------------------------"
    fi
  done
}

install_missing_packages || echo "failed to install missing packages"

export DOTFILES="$HOME/.dotfiles"

if [ -d "$DOTFILES" ]; then
  echo "Dotfiles have already been cloned into the home dir"
else
  echo "Cloning dotfiles"
  git clone https://github.com/ambushed/dotfiles.git ~/.dotfiles
fi

cd "$DOTFILES" || "Didn't cd into dotfiles this will be bad :("
git submodule update --init --recursive
pwd

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install fzf
#
if ! exists fzf; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else 
  echo "FZF is already installed"
fi

if [ "$(basename $SHELL)" == "zsh" ]; then
  echo "Running zsh. No need to change shell!"
else
  echo "---------------------------------------------------------"
  echo "Changing to zsh"
  echo "---------------------------------------------------------"
  chsh -s "$(which zsh)"
fi

$DOTFILES/install

echo "---------------------------------------------------------"
echo "All done!"
echo "---------------------------------------------------------"
