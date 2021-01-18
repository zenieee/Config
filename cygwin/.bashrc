# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.3-2

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Programmable completion enhancements are enabled via
# /etc/profile.d/bash_completion.sh when the package bash_completetion
# is installed.  Any completions you add in ~/.bash_completion are
# sourced last.

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func
# Tell less not to beep and also display colours

# export TERM=vt100
# TMOUT=1
# clear

umask 0027
# unset HISTFILE
# unset HISTFILESIZE
# unset HISTSIZE

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

# PORTABLE=`cygpath -w ${HOME}\\\\${USERNAME}\\\\portable`
# alias 7='${HOME}/${USERNAME}/portable//7-ZipPortable/7-ZipPortable.exe &'
# alias f='${HOME}/${USERNAME}/portable/FirefoxPortable/FirefoxPortable.exe &'
# alias n='${HOME}/${USERNAME}/portable/NotepadPortable/NotepadPortable.exe &'
# alias p='cmd /c "explorer $PORTABLE"'

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

LANG="en_US.utf8"

alias winx='explorer.exe /e,$(cygpath -w -a .)'


