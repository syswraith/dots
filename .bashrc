# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Vim supremacy
export EDITOR='vim -v'
export VISUAL='vim -v'

# Command specific
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al --color=auto'

# SSH connections
alias telehack="ssh rflash@telehack.com -p 6668"
alias ctrlc="ssh fey@ctrl-c.club"

# Package specific
alias bb="brave"
alias pp="python3"
alias gpp="g++ -std=c++20"
alias pl="perl"
alias cclip="wl-copy"
alias vim='vim -v'
alias vi='vim -v'
alias lstpkgs="pacman -Qei | awk '/^Name/ { name=\$3 } /^Groups/ { if ( \$3 != \"base\" && \$3 != \"base-devel\" ) { print name } }'"
alias ifconfig="ip addr" # net-tools is depreciated, so an illegal workaround
alias cdtemp='cd $(mktemp -d)'
alias gittt="git add . && git commit -m \"$(date)\" && git push"
alias gpom="git pull origin main"

# Environment variables
PS1='\$ '
HISTTIMEFORMAT="%F %T "
github="https://github.com/syswraith"
hyprconf="/home/syswraith/.config/hypr/hyprland.conf"
# For hassle-free creation of venvs in python
pyvenv(){
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

update_packages() { current_path=$(pwd) && cd ~/Important/package_management/dotfiles && ./packages.sh && cd $current_path; } # Requires this directory structure to work
get() { yay -S "$@" && update_packages; }
unget() { yay -R "$@" && update_packages; }

# Created by `pipx` on 2025-02-13 19:06:28
export PATH="$PATH:/home/syswraith/.local/bin"

