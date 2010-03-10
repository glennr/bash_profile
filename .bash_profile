#export EDITOR=vim
export EDITOR='mate -w'
export GIT_EDITOR='mate -wl1'. #This instructs TextMate to open with the caret at line 1 rather than where it last was.
export SVN_EDITOR=vim

# keep all those useful commands in .[ba]sh_history
export HISTFILESIZE=10000
export HISTSIZE=2500

alias c="cd"
set complete="enhance"

[ -f /etc/profile ] && . /etc/profile
[ -f ~/.bashrc ]    && . ~/.bashrc

set -o vi

alias emcas=emacs
alias t1='tracert 1.1.1.1'
alias ll="ls -al"
alias lt="ls -lrt"
alias pu="ps -fu $USER"
alias vi="vim"
alias tracert="traceroute"

#easy copy
#alias sc='scp $1 username@site.com:/var/tmp/ '

#Color for mac leopard bash terminal
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=ExFxCxDxBxegedabagacad


### Mac ports in /opt/local/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

### ruby
#
export RUBYLIB=$RUBYLIB:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/gems/1.8/

#Rails autotest
export AUTOFEATURE=true
export RSPEC=true

## Local Gems
export PATH=$HOME/.gem/ruby/1.8/bin:$PATH

##
# Your previous /Users/glennroberts/.bash_profile file was backed up as /Users/glennroberts/.bash_profile.macports-saved_2009-09-07_at_17:14:44
##

# MacPorts Installer addition on 2009-09-07_at_17:14:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-09-07_at_17:14:44: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

### RAILS SHORTCUT GLORY
#

# printf "\033[0m0 All attributes off\033[0m\n"
# printf "\033[1m1 Bold\033[0m\n"
# printf "\033[4m4 Underline\033[0m\n"
# printf "\033[5m5 Blink\033[0m\n"
# printf "\033[7m7 Invert\033[0m\n"
# printf "\033[8m8 Hide\033[0m8 = Hide\n"
# printf "\033[30m30 Black\033[0m30 = Black\n"
# printf "\033[31m31 Red\033[0m\n"
# printf "\033[32m32 Green\033[0m\n"
# printf "\033[33m33 Yellow\033[0m\n"
# printf "\033[34m34 Blue\033[0m\n"
# printf "\033[35m35 Magenta\033[0m\n"
# printf "\033[36m36 Cyan\033[0m\n"
# printf "\033[37m37 White\033[0m\n"
# printf "\033[40m\033[37m40 Black Background\033[0m\n"
# printf "\033[41m41 Read Background\033[0m\n"
# printf "\033[42m42 Green Background\033[0m\n"
# printf "\033[43m43 Yellow Background\033[0m\n"
# printf "\033[44m44 Blue Background\033[0m\n"
# printf "\033[45m45 Magenta Background\033[0m\n"
# printf "\033[46m46 Cyan Background\033[0m\n"
# printf "\033[47m47 White Background\033[0m\n"

export TM_RUBY="/opt/local/bin/ruby"

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export PS1='\[\033[0;32m\]\h\[\033[0;34m\] \w$ '

# Bash prompt showing current git branch & marking if dirty:
# Based on http://henrik.nyh.se/2008/12/git-dirty-prompt

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1=$(echo "$PS1" | sed 's/\\w/\\w\\[\\033[35m\\]$(parse_git_branch)\\[\\033[0m\\]/g')
# no colors : export PS1=$(echo "$PS1" | sed 's/\\w/\\w$(parse_git_branch)/g')


function manpdf() {
  man -t $@ | open -f -a /Applications/Preview.app/
}

# General
alias l='ls -lah'
alias h='history'
alias ..='cd ..'
alias ...='cd ../..'
#alias diff='/opt/local/libexec/git-core/git-diff'

# TextMate
alias m='mate'
alias mr='mate README TODO app/ config/ db/ doc/ lib/ public/javascripts public/stylesheets test/ spec/ features/ stories/ vendor/plugins'

### GIT
#

### Dont forget to set up Git autocompletion first:
#     http://blog.ericgoodwin.com/2008/4/10/auto-completion-with-git
source ~/.git-completion.bash

###
alias gs='git status'
alias gca='git commit -a -m'
alias gcm='git commit -m'
alias gb='git branch'
alias gd='git diff'

alias gk='gitk &'

alias gfo='git fetch origin'
alias gfom='git fetch origin master'
alias grom='git rebase origin/master'

alias gp='git pull'
alias gplom='git pull origin master'
alias gpom='git push origin master'

alias gphm='git push heroku master'
alias hmig='heroku rake db:migrate'
alias hlog='heroku logs'
alias hopen='heroku open'

alias ship='gpom; gphm;'

# gc => git checkout master
# gc bugs => git checkout bugs
function gc {
  if [ -z "$1" ]; then
git checkout master
  else
git checkout $1
  fi
}

# SVN
alias sup='svn up'
alias sst='svn st'
alias sstu='svn st -u'
alias sci='svn commit'
alias sdi='svn diff'
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf'
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'

# Ruby
alias irb='irb --readline -r irb/completion -rubygems'
function cdgem {
  cd /opt/local/lib/ruby/gems/1.8/gems/; cd `ls|grep $1|sort|tail -1`
}

# Rails
alias r='touch tmp/restart.txt'
alias olh='open http://localhost:3000'
alias olh1='open http://localhost:3001'
alias ss='olh; script/server --debugger;'
alias ss1=' olh1; script/server --port=3001 --debugger;'
alias sc='script/console --debugger'
alias sg='script/generate'
alias sd='script/destroy'
alias sdb='script/dbconsole'

alias a='autotest --rails'

alias cw='compass --watch'

alias rgi='rake gems:install'

alias dbm='rake db:migrate'
alias dbmt='rake db:migrate RAILS_ENV=test'
alias dbm0='rake db:migrate VERSION=0'
alias dbi='rake db:initialize'
alias dbp='rake db:populate'
alias dbtp='rake db:test:prepare'
alias dbd='rake db:drop'
alias dbdt='rake db:drop RAILS_ENV=test'
alias dbda='rake db:drop:all'
alias dbca='rake db:create:all'
alias dbcycle='dbda && dbca && dbm; dbi; dbp; dbtp'

alias cf='cucumber features'

function sc {
  if [ -x script/console ]; then
script/console
  else
sinatra_rb=`egrep -l "^require.+sinatra.$" *.rb 2>/dev/null`
    if [ -e $sinatra_rb ]; then
irb -r $sinatra_rb
    else
irb
    fi
fi
}


### uber Bash Prompt
#

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=25
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color

    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white

    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"

    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"

    local UC=$G                	# user's color
    [ $UID -eq "0" ] && UC=$R   # root's color

    PS1="$TITLEBAR ${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
	SUDO_PS1="$TITLEBAR ${EMR}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
	#better prompt
	#PS1='\[\033[1;30m\]\u@\h \W>\$ \[\033[0m\]'
	#better prompt for sudo
	#SUDO_PS1='[\u@\h \W]\$ '
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt

