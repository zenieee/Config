# export TERM=vt100
# TMOUT=1
# clear

if [ "$TERM" = "putty" ]; then
  export LC_ALL=C
else
  export LC_ALL=en_US.utf8
fi


umask 0027
unset HISTFILE
unset HISTFILESIZE
unset HISTSIZE
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# export HISTCONTROL=ignoreboth
# shopt -s histappend
# shopt -s checkwinsize
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi

set bell-style visible

if [ -x /usr/bin/dircolors ]; then
 eval "`/usr/bin/dircolors -b`"
# alias ls='/bin/ls -alF --color=tty --show-control-chars'
 alias ls='/bin/ls -m --color=tty --show-control-chars'
 alias dir='dir --color=auto'
 alias vdir='vdir --color=auto'
 alias grep='grep --color=auto'
 alias fgrep='fgrep --color=auto'
 alias egrep='egrep --color=auto'
fi

# Tell less not to beep and also display colours
export LESS="-QR"

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias more='less'

# UTF-8 encoding
# Remove next line if trouble ssh from commandline
# These lines were removed becasue rsync was causing an error
# echo -ne '\e%G\e[?47h\e%G\e[?47l'
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LANG=en_CA.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# if [ ! -e "${HOME}/.ssh" ] ; then
#  mkdir "${HOME}/.ssh"
# fi
# SSH_KEY="${HOME}/.ssh/${USERNAME}@${COMPUTERNAME}"
# if [ ! -e $SSH_KEY ] ; then
#  ssh-keygen.exe -t rsa -N '' -q  -f $SSH_KEY
# fi

# Launch screen session at login
# screen -xRR

### START-Keychain ###
# Let  re-use ssh-agent and/or gpg-agent between logins
# /usr/bin/keychain --clear
#/usr/bin/keychain $HOME/.ssh/id_rsa
# source $HOME/.keychain/$HOSTNAME-sh
### End-Keychain ###

# PATH=${PATH}:/usr/local/bin:/usr/local/etc:/usr/local/tty:/usr/local/lib
# PATH=${PATH}:$(find /usr/local -type d | tr '\n' ':' | sed 's/:$//')
# PATH='./:/usr/local/bin/gnuplot/binary:/usr/local/bin/texmakerx:/usr/local/bin/ghostgum:${PATH}'

# Check that we haven't already been sourced.
# ([[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1") || return
# If not running interactively, don't do anything
# [[ "$-" != *i* ]] && return

# Set a default prompt of: user@host and current_directory
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]\n\$ "

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"


# Auto-launching ssh-agent on msysgit
# You can run ssh-agent automatically when you open bash by 
# adding the following to your ~/.profile or ~/.bashrc file:
# SSH_ENV="$HOME/.ssh/environment"
# # start the ssh-agent
# function start_agent {
    # echo "Initializing new SSH agent..."
    # # spawn ssh-agent
    # ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    # echo succeeded
    # chmod 600 "$SSH_ENV"
    # . "$SSH_ENV" > /dev/null
    # ssh-add
# }
# # test for identities
# function test_identities {
    # # test whether standard identities have been added to the agent already
    # ssh-add -l | grep "The agent has no identities" > /dev/null
    # if [ $? -eq 0 ]; then
        # ssh-add
        # # $SSH_AUTH_SOCK broken so we start a new proper agent
        # if [ $? -eq 2 ];then
            # start_agent
        # fi
    # fi
# }
# # check for running ssh-agent with proper $SSH_AGENT_PID
# if [ -n "$SSH_AGENT_PID" ]; then
    # ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    # if [ $? -eq 0 ]; then
	# test_identities
    # fi
# # if $SSH_AGENT_PID is not properly set, we might be able to load one from
# # $SSH_ENV
# else
    # if [ -f "$SSH_ENV" ]; then
	# . "$SSH_ENV" > /dev/null
    # fi
    # ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
    # if [ $? -eq 0 ]; then
        # test_identities
    # else
        # start_agent
    # fi
# fi
# The process will continue to run until you log out, shutdown or kill 
# ssh-agent. To kill the process, find its PID with ps then call kill 
# The default key files (.ssh/id_rsa, .ssh/id_dsa and .ssh/identity) 
# should be handled automatically. If you have a key with a different 
# name, you can add it with ssh-add path/to/my_key

# Do not save command starting with space
HISTCONTROL=ignorespace
# Erase duplicate
HISTCONTROL=ignorespace:erasedups
# Formate history
HISTTIMEFORMAT="%F %T  "




# Nicer shell experience
# export GREP_OPTIONS="--color=auto"; # make grep colorful
# export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD; # make ls more colorful as well
# export HISTSIZE=32768; # Larger bash history (allow 32³ entries; default is 500)
# export HISTFILESIZE=$HISTSIZE;
# export HISTCONTROL=ignoredups; # Remove duplicates from history. I use `git status` a lot.
# export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"; # Make some commands not show up in history
# export LANG="en_US.UTF-8"; # Language formatting is still important
# export LC_ALL="en_US.UTF-8"; # byte-wise sorting and force language for those pesky apps
# export MANPAGER="less -X"; # Less is more
# export GPG_TTY=$(tty); # for gpg key management

