#!/usr/bin/env bash

# .bashrc
# bashrc is for aliases, functions, and shell configuration intended for use in
# interactive shells.  However, in some circumstances, bash sources bashrc even
# in non-interactive shells (e.g., when using scp), so it is standard practice
# to check for interactivity at the top of .bashrc and return immediately if
# the shell is not interactive.  The following line does that; don't remove it!
[[ $- != *i* ]] && return

# Load CentOS stuff and Facebook stuff (don't remove these lines).
source /etc/bashrc
source /usr/facebook/ops/rc/master.bashrc

# Keep oodles of command history (see https://fburl.com/bashhistory).
HISTFILESIZE=-1
HISTSIZE=1000000
shopt -s histappend

# Set up personal aliases, functions, etc.  See https://fburl.com/bash.
# ...(put your own stuff here!)...

source ~/.bash_prompt
source ~/.aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
export PATH=/home/robertycxu/nodenew/node-v16.13.2-linux-x64/bin:$PATH
export PATH=/home/robertycxu/clangd_13.0.0/bin:$PATH
