#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls -a'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias :r='make'
alias :l='make $*'
alias :q='exit'
alias :ga='git add .'
alias :gc='git commit -a $*'
alias :gca='git commit -a $*'
alias :gp='git push'
alias :o='xdg-open $*'
PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/.cabal/bin
 #export XMODIFIERS=@im=fcitx
 #export GTK_IM_MODULE=xim
 #export QT_IM_MODULE=xim