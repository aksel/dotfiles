HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

setopt incappendhistory autocd

autoload -Uz compinit
compinit

# key bindings
bindkey -e
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5H" beginning-of-history
bindkey "^[[1;5F" end-of-history
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-delete-word

# aliases
alias ls='pwd && ls --color=auto'

alias dotfiles='cd ~/dev/dotfiles'

alias spotifyd-restart='systemctl --user restart spotifyd'

alias yt-480='mpv -ytdl-format="[height<=?480]"'

# Sets the title of the terminal
# Useful for terminals running some process that doesn't emit a title
function set_title() {
  echo -e "\e]0;$1\a"
}

# https://www.reddit.com/r/linux/comments/8vzr3y/whats_the_most_frequent_terminal_command_you_use/
function usage() {
  history 1 | cat | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
}

# Load color schemes
cat ~/.cache/wal/sequences
