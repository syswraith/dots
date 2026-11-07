# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Keep text indicators AND force block cursors
set show-mode-in-prompt on

# Start the terminal as a block cursor
echo -ne "\e[1 q"

# Vim supremacy
set -o vi
alias vi='nvim'
export EDITOR='nvim'
export VISUAL='nvim'

# Command specific
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al --color=auto'
alias apt='pacman'
alias tmux="tmux -u"
alias telehack="ssh rflash@telehack.com -p 6668"
alias ctrlc="ssh fey@ctrl-c.club"
alias cclip="wl-copy"
alias cdtemp='cd $(mktemp -d)'
alias gittt="git add . && git commit -m \"$(date)\" && git push"
alias gpom="git pull origin"
alias ccc="g++ -std=c++20"
alias ifconfig="ip addr" # net-tools is depreciated, so an illegal workaround
alias lstpkgs="pacman -Qei | awk '/^Name/ { name=\$3 } /^Groups/ { if ( \$3 != \"base\" && \$3 != \"base-devel\" ) { print name } }'"
alias pl="perl"
alias pp="python3"
alias webserve="python3 -m http.server -d"
alias cat='bat'
alias z="zoxide"
alias bathelp='bat --plain --language=help'
alias open='xdg-open'
alias nvimcfg="nvim $HOME/.config/nvim/"
alias swaycfg="nvim $HOME/.config/sway/"
alias hx="helix"
alias todo="nvim todo.md"
alias yy="yazi"

PS1='\$ '
HISTTIMEFORMAT="%F %T "
gh="https://github.com/syswraith"

help() { "$@" --help 2>&1 | bathelp; }

nvim() {
  if [ $# -eq 0 ]; then
    command nvim .
  else
    command nvim "$@"
  fi
}

function ycd() {
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi --cwd-file="$tmp" "$@"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd "$cwd" || return
  fi
  rm -f -- "$tmp"
}

# For hassle-free creation of venvs in python
pyvenv() {
  if [[ "$1" == "on" ]]; then
    source ./venv/bin/activate
  elif [[ "$1" == "off" ]]; then
    deactivate
  else
    python3 -m venv venv && source ./venv/bin/activate
  fi
}

# For managing the backlight on my laptop
backlight() {
  if [[ "$1" == "up" ]]; then
    gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Keyboard.StepUp
  elif [[ "$1" == "down" ]]; then
    gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Keyboard.StepDown
  else
    echo "Usage: backlight {up|down}"
  fi
}

furl() {
  XDG_RUNTIME_DIR=/run/user/$(id -u) WAYLAND_DISPLAY=wayland-0 nohup xdg-open "$1" >/dev/null 2>&1 &
}

# if [ -z "$TERM_HANDLER" ] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux -u
# fi

eval "$(zoxide init bash)"
eval "$(fzf --bash)"

export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/home/syswraith/.bun/bin
export PATH=$PATH:/home/syswraith/.cargo/bin
export PATH="$PATH:/home/syswraith/.local/bin"
export DESKTOP_FILES=/home/syswraith/.local/share/applications/
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

export FZF_CTRL_T_COMMAND=""
# Enable a side preview window for fzf using bat
export FZF_CTRL_T_OPTS="--preview 'cat {}' --preview-window=right:60%:wrap"

/usr/bin/cat /home/syswraith/.plan
