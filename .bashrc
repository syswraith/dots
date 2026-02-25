# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Vim supremacy
export EDITOR='nvim'
export VISUAL='nvim'

# Command specific
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al --color=auto'

# SSH connections
alias telehack="ssh rflash@telehack.com -p 6668"
alias ctrlc="ssh fey@ctrl-c.club"

# Browser shortcuts
alias tw="flatpak run com.brave.Browser https://x.com"
alias ig="flatpak run com.brave.Browser https://instagram.com"
alias wa="flatpak run com.brave.Browser https://web.whatsapp.com"
alias tg="flatpak run com.brave.Browser https://web.telegram.org"
#alias zed="flatpak run dev.zed.Zed"

# Package specific
alias bb="flatpak run com.brave.Browser"
alias cclip="wl-copy"
alias cdtemp='cd $(mktemp -d -p ~/code/)'
alias cdtemp='cd $(mktemp -d)'
alias gittt="git add . && git commit -m \"$(date)\" && git push"
alias gpom="git pull origin main"
alias ccp="g++ -std=c++20"
alias ifconfig="ip addr" # net-tools is depreciated, so an illegal workaround
alias lstpkgs="pacman -Qei | awk '/^Name/ { name=\$3 } /^Groups/ { if ( \$3 != \"base\" && \$3 != \"base-devel\" ) { print name } }'"
alias pl="perl"
alias pp="python3"
alias vi='nvim'
alias cat='bat'
alias bathelp='bat --plain --language=help'
alias open='xdg-open'

colossus() { rga $(printf -- '-e %q ' "$@") ~/Documents/colossus/; }
help() { "$@" --help 2>&1 | bathelp; }

# Yazi file manager
alias yy="yazi"
function ycd() {
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi --cwd-file="$tmp" "$@"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd "$cwd" || return
  fi
  rm -f -- "$tmp"
}

# Environment variables
PS1='\$ '
HISTTIMEFORMAT="%F %T "
gh="https://github.com/syswraith"

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

# Created by `pipx` on 2025-02-13 19:06:28
export PATH="$PATH:/home/syswraith/.local/bin"

export YDOTOOL_SOCKET="$HOME/.ydotool_socket"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

# Android SDK
export ANDROID_HOME=/usr/lib/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator

# Cordova (installed via Bun)
export PATH=$PATH:/home/syswraith/.bun/bin
