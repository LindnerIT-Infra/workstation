# workstation
Workstation bootstrapping (WSL)
=======
# Workstation Bootstrapping
This repository contains configuration files (`zsh`, `tmux`, `VS Code`) and a setup script to bootstrap a polished Ubuntu-based workstation (WSL).

## Clone And Install
```bash
git clone -b master --recurse-submodules git@github.com:LindnerIT-Infra/workstation.git
workstation/setup.sh
```

## VS Code
The recommended approach is to work with separate VS Code workspaces.

For Ansible, use `~/workspaces/ansible`. This workspace includes a Python virtual environment with the basic Ansible requirements.

Open `ansible.code-workspace` in VS Code and clone the repositories you need into `~/workspaces/ansible`.

Recommended VS Code extension:
- `Ansible` (Red Hat)
