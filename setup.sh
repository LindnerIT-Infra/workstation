#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

# --- Install basic packages
sudo apt-get update
sudo apt-get install -y \
  curl git ca-certificates unzip build-essential

mkdir ~/.local/bin/ || true

# --- Install extra packages
if [[ -f packages-apt.txt ]]; then
  xargs -r sudo apt-get install -y < $SCRIPT_DIR/packages-apt.txt
fi

ln -s $SCRIPT_DIR/.powerlevel10k ~/.powerlevel10k || true
ln -s $SCRIPT_DIR/.tmux ~/.tmux || true
ln -s $SCRIPT_DIR/.tmux.conf ~/.tmux.conf || true
ln -s $SCRIPT_DIR/.p10k.zsh ~/.p10k.zsh || true
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc || true

# get and build zsh-ssh-tmux
if [ ! -f ~/.local/bin/zsh-ssh-tmux ]; then
  cd $SCRIPT_DIR/zsh-ssh-tmux
  go build -o ssh-conf-gen .
  mv ssh-conf-gen ~/.local/bin/
fi

# prepare python venv for vsdoe
if [ ! -d ~/workspaces/ansible/.venv ]; then
  mkdir -p ~/workspaces/ansible/
  python3 -m venv ~/workspaces/ansible/.venv
  source ~/workspaces/ansible/.venv/bin/activate
  python -m pip install -U pip wheel
  pip install -r $SCRIPT_DIR/requirements-ansible.txt 
fi

ln -s $SCRIPT_DIR/ansible.code-workspace ~/workspaces/ansible/ansible.code-workspace || true
