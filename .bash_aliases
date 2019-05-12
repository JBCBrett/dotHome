# BASH

alias lac='l -a'
alias lsh='ls -a'
#alias test='echo "test"'
alias rm='trash "$@"'
#alias test="cp $1 $2`date +%Y`"

#alias x='cp $1 "$(date +"%y")"'
#mv backup1.tar "$(date +"%m-%d-%y")"


#alias x='cp $1 $1`date +%d%b%Y`'
#alias x='cp $1 $2-wp-app-`date +%d%b%Y`'
#alias x='mv $1 $2' && 'cp $2 $2-wp-app-`date +%d%b%Y`'

### WORKING ITERATIONS
#cp test "$(date +"%y")"
#alias x='cp $1 $2'
#alias x='mv $1 $2'

# VIEW REFERENCE FILES
alias lin='cd ~/Dropbox/clients/brett/reference && vim refLinuxMint.md'
alias refe='cd ~/Dropbox/clients/brett/reference && vim $1'
#alias lr='cd ~/Dropbox/clients/brett/reference/ && view $1'
#alias lr='less -N ~/Dropbox/clients/brett/reference/$@'
#alias lr='less -N ~/Dropbox/clients/brett/reference/'$1''
alias view='view $1'
alias bh='view ~/Dropbox/clients/brett/reference/ref-aliases.md'

## MANAGE MERGE TERMS
alias viewterms='view raw cased cleaned'
alias mergeterms='sedscr raw > cleaned && caseterms && acronyms -i cased'
#alias catterms='view -N cased cleaned raw'

# FLUSH MERGE TERMS
alias flushterms="sed -i '/./d' cased && sed -i '/./d' cleaned"
alias raw='sed -f ~/.local/bin/sedscr input > output'

## MANAGE DOT FILES
alias ea='vim ~/.bash_aliases'
alias va='cd ~ && view .bash_aliases'

alias gr='cd ~/Dropbox/clients/brett/reference'
alias gt='cd ~/.local/share/Trash'
alias i='xdg-open $1'

alias so='source ~/.bashrc && c'

# go to this dir and clear screen
alias gc='cd ~/Dropbox/clients && c'
alias gr='cd ~/Dropbox/clients/brett/reference/ && ls ref*'
#alias gr='sudo less -N ~/Dropbox/clients/brett/reference/ref-ranger.md'

# BRETT CREATED THIS FILE
alias c='clear'

# LIST FILES
#alias lf='find ./  -printf "%f\n | less'
alias lf="ls -l | egrep -v '^d'"
alias ld="ls -l | egrep '^d'"
alias lh="ls -ld .?*"
alias b='cd ..'
# alias ls='ls --color -h --group-directories-first'
alias ls='ls --color -l --group-directories-first'
alias r='cd ~/.config/ranger'

# VIM/GVIM
#export EDITOR=vim
#export EDITOR="gvim --remote-silent" "$@"
export VISUAL=vim
#export VISUAL="gvim --remote-silent" "$@"
#export EDITOR="vim --remote-silent" "$@"
#export EDITOR="vim --remote-silent" "$@"

#alias bash='gvim ~/.bashrc'
# bulkrename
alias mdr='qmv *.md -f do'
alias pdfr='qmv *.pdf -f do'
alias jpgr='qmv *.jpg -f do'
alias pngr='qmv *.png -f do'
alias vimr='qmv *.vim -f do'
alias vim_r='qmv *.vim_ -f do'
alias xmlr='qmv *.xml -f do'
alias txtr='qmv *.txt -f do'
alias ren='qmv -f do'
#alias all='qmv ALL*.* -f do'
#alias core='qmv CORE*.* -f do'
alias cd..='cd ..'

# RANGER SETTINGS
alias gvim='gvim --remote-tab-silent' "$@"
alias tag="ranger --list-tagged-files=*"

# RANKTRACKER
alias fixrt="ulimit -c unlimited"

# Awk won't work with alias. yank following line, paste into terminal prompt with <c-s-v> and edit filename
#awk -F';' '{ idx=$1; if (array[idx] == 1) {print} else if (array[idx]) {print array[idx]; print; array[idx]=1} else {array[idx]=$0}}' keysBrookman.md

# AWK COMMANDS
#alias test="echo | aud $2 == 2200 clients"

#alias 1="echo | aud 1st clients | sort -nrk2"
#alias 15="echo | aud 15th clients | sort -nrk2"
alias 1='c && echo "" && echo "Sorted by Company" && cycle 1st clients | sort -k1 && echo "" && echo "Descending Sort By Rank Tracker Terms" && cycle 1st clients | sort -nrk3'
alias 15='c && echo "" && echo "Sorted by Company" && cycle 15th clients | sort -k1 && echo "" && echo "Descending Sort By Rank Tracker Terms" && cycle 15th clients | sort -nrk3'
alias 99='c && echo "" && echo "Companys Where Cycle Is Set To 99...AKA Dormant" && cycle99 99 clients'
alias all='c && echo "" && echo "All Companies In History" && allclients [a-z] clients'
alias active='c && echo "" && echo "Active Companies" && activeclients 99 clients'

#alias activeclients='activeclients 99 clients'
#alias allclients='allclients co clients'
#alias allclients='allclients co clients'



##alias 15="echo | aud [[:space:]]15th clients"
#alias 15audit="echo | aud [[:space:]]15th.*[[:space:]]audit clients"
#alias 15snap="echo | aud [[:space:]]15th.*[[:space:]]snap clients"
#
##alias 1="echo | aud [[:space:]]1st clients"
#alias 1audit="echo | aud [[:space:]]1st.*[[:space:]]audit clients"
#alias 1snap="echo | aud [[:space:]]1st.*[[:space:]]snap clients"
#
#alias nosnap="echo | aud [[:space:]]nosnap clients"
#alias snap="echo | aud [[:space:]]snap clients"
#alias audit="echo | aud [[:space:]]audit clients"
#
#alias brett="echo | aud [[:space:]]brett clients"
#alias jordan="echo | aud [[:space:]]jordan clients"
#alias ben="echo | aud [[:space:]]ben clients"

#function count { grep -l "$1" * | wc -l }
#alias count='echo | grep -l "$1" * | wc -l'
alias count='count_files_matching_pattern' "$@"
alias files='files_matching_pattern' "$@"
alias nofiles='files_not_matching_pattern' "$@"
alias gill='pdflatex gilligan.txt'
alias sleep='sudo pm-suspend-hybrid'

# MAILMERGE PROCESS
alias getmerge='cd ~/merge && source ~/merge/venv/bin/activate && c'

alias loadmerge='virtualenv venv && source venv/bin/activate && pip install mailmerge'
alias merge='mailmerge --dry-run --no-limit'
# alias getsource='cp ~/Dropbox/clients/batbelt/zMASTER-merge/terms.txt . && cp ~/Dropbox/clients/batbelt/zMASTER-merge/plate.txt .'
alias getfiles='cp ~/Dropbox/clients/batbelt/zMASTER-merge/mailmerge_template.txt . && cp ~/Dropbox/clients/batbelt/zMASTER-merge/mailmerge_database.csv .'
alias proj='cd ~/Dropbox/clients/bld/projB-new-source-initial-merge'


#eval "$(fasd --init auto)"
alias v='f -e vim' # quick opening files with vim
alias g='f -e gvim remote-silent' "$@" # quick opening files with vim

#alias getmerge='source ~/Dropbox/clients/batbelt/merge/venv/bin/activate'
alias redirects='curl -I $1' "$@"

