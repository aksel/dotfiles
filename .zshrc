# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

setopt incappendhistory autocd

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aksel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line

# aliases
alias ls='pwd && ls --color=auto'
alias suspend="i3lock -c 000000 && sudo systemctl suspend"
alias hibernate="i3lock -c 000000 && sudo systemctl hibernate"

alias dotfiles='cd ~/dev/dotfiles'

alias spotifyd-restart='systemctl --user restart spotifyd'

# Sets the title of the terminal
# Useful for terminals running some process that doesn't emit a title
function set_title() {
  echo -e "\e]0;$1\a"
}

# https://www.reddit.com/r/linux/comments/8vzr3y/whats_the_most_frequent_terminal_command_you_use/
function usage() {
  history 1 | cat | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
}

# Toggles the touchpad (or whatever device is is number 13 in xinput)
function toggle_touchpad() {
  integer state=$(xinput list-props 13 | grep "Device Enabled" | grep -o "[0|1]$")
  xinput set-prop 13 "Device Enabled" $(($state^1))
}

function pm2-log() {
  tail ~/.pm2/logs/$1-error.log ~/.pm2/logs/$1-out.log --follow
}
