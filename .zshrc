# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Prompt (Powerlevel10k) ---
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# --- Completion ---
autoload -Uz compinit
compinit

# --- Completion: Menü mit Highlighting/Selection ---
zstyle ':completion:*' menu select          # statt nur Liste -> auswählbares Menü
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # Farben wie bei ls

# Groß-/Kleinschreibung toleranter
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Optional: Completion-Listen kompakter
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# --- Plugins (interaktiv) ---
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax-Highlighting muss ziemlich weit unten kommen:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
setopt hist_ignore_all_dups
setopt inc_append_history
unsetopt beep
bindkey -v
# ~/.local/bin in PATH (falls du es nutzt)
export PATH="$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval `keychain --eval --quiet --agents ssh ~/.ssh/id_rsa`
