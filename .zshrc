# Lines configured by zsh-newuser-install                                                                                                                                                                                                 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/klaus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

export PROMPT='%F{green}[%D{%Y-%m-%d-%T}]%F{6}%n%f%F{blue}@%F{blue}%m%f %F{red}%2~%f '
export EDITOR=/usr/bin/vim

# Basic info
HOSTNAME=`uname -n`

# determine your diskname (xvda1) with with df -Ph before
ROOT=`df -Ph | grep da1 | awk '{print $4 " available (" $5 " used)"}' | tr -d '\n'`
DATA=`df -Ph|grep db|awk '{print $4 " available (" $5 " used)"}'|tr -d '\n'`
# System load
MEMORY1=`free -t -m | grep Total | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

echo "===============================================
- Hostname............: $HOSTNAME
- Disk ROOT ..........: $ROOT
- Disk DATA...........: $DATA
===============================================
- CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
- Memory used.........: $MEMORY1 / $MEMORY2
- Swap in use.........: `free -m | tail -n 1 | awk '{print $3}'` MB
===============================================
"
