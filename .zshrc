#bindkey "\e[A" up-line-or-search
KEYTIMEOUT=1

globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

paste-xclip() {
    BUFFER="$BUFFER`xclip -o`"
    zle end-of-line
}
zle -N paste-xclip
bindkey '^t' paste-xclip

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

alias grep='grep --color=auto'

alias -g P='| '
alias -g L='| less'
alias -g G='| grep'
alias -g GI='| grep -i'
alias -g EG='| egrep'
alias -g EGI='| egrep -i'
alias -g X='| xargs'
alias -g XG='| xargs grep'
alias -g XE='| xargs egrep'
alias -g WL='| wc -l'
alias -g PI="perl -pi -e 's|||'"
alias -g PNE="perl -ne 'm|| && print \"print \$1\\n\"'"
alias -g SN='| sort -n'
alias -g CT="| cut -f1 -d' '"
alias -g H='| head'
alias -g T='| tail'
alias -g T1='| tail -n 1'
alias -g U='| uniq'
alias -g SU='| sort | uniq -c'
alias -g ND='*(/om[1])'
alias -g NF='*(.om[1])'
alias tmx='tmux new -s'

alias -s py=python

# setopt

setopt correct
setopt correctall
# setopt print_exit_value
setopt nohistverify
setopt noclobber
setopt extendedglob
setopt kshoptionprint
setopt completealiases
setopt numericglobsort

# Meta-u to chdir to the parent directory
bindkey -s '\eu' '^Ucd ..^M'
bindkey -s '\eU' '^Ucd ..; ls^M'

# If AUTO_PUSHD is set, Meta-p pops the dir stack
bindkey -s '\ep' '^Upopd >/dev/null^M'
bindkey -s '\eP' '^Upopd >/dev/null; dirs -v^M'

# Pipe the current command through less
bindkey -s "\em" " 2>&1|less^M"

# Meta-c: ls -lart
bindkey -s '\ec' 'ls -lart^M'

# Override Ctrl-u behavior to only kill before point
bindkey "^u" backward-kill-line

eval "$(fasd --init auto)"
alias a='nocorrect fasd -a'
alias s='nocorrect fasd -si'
alias sd='nocorrect fasd -sid'
alias sf='nocorrect fasd -sif'
alias d='nocorrect fasd -d'
alias f='nocorrect fasd -f'
alias z='nocorrect fasd_cd -d'
alias zz='nocorrect fasd_cd -d -i'
alias vv='f -t -e vim -b viminfo'
bindkey '^X^A' fasd-complete   # files and directories
bindkey '^X^F' fasd-complete-f # files only
bindkey '^X^D' fasd-complete-d # directories only

bindkey '\e\e[D' emacs-backward-word
bindkey '\e\e[C' emacs-forward-word

alias v='vim'
alias V='vim +'

complete-or-list() {
	[[ $#BUFFER != 0 ]] && { zle expand-or-complete; return 0 }
	echo
	ls -lart
	zle reset-prompt
}
zle -N complete-or-list
bindkey '^I' complete-or-list

accept-line() {
	[[ $BUFFER[-2,-1] == '  ' ]] && BUFFER="${BUFFER} | less"
	zle .accept-line
}
zle -N accept-line


# FUNCTIONS

skip() {
	tail -n +$(($1+1))
}

highlight() {
	\grep -E "$1|$"
}

ec () {
	emacsclient --alternate-editor="" -c "$@"
}

swapFiles() {
	mv -i $1 $1.tmp
	mv -i $2 $1
	mv -i $1.tmp $2
}

stripPath() {
	pre=$1
	post=$2
	shift; shift
	for i in $@; do
		print ${(j:/:)${(s:/:)i}[-$pre,-$post]}
	done
}

replaceLink() {
	\cp -f --remove-destination "$(readlink $1)" "$1"
}

attachTmux() {
	if [[ -z "$1" ]]; then
		tmux list-sessions
	else
		tmux attach -t "$1"
	fi
}

mysql_() {
	suffix=$1; shift
	mysql --default-group-suffix=$suffix $*
}

vimp() {
	vim +1 "+/$1" $2
}

# EXPORT

export VISUAL=vim
export EDITOR=vim


grml-zsh-fg() {
	if (( ${#jobstates} )); then
		zle .push-input
		[[ -o hist_ignore_space ]] && BUFFER=' ' || BUFFER=''
		BUFFER="${BUFFER}fg"
		zle .accept-line
	else
		zle -M 'No background jobs. Doing nothing.'
	fi
}
zle -N grml-zsh-fg

autoload -U forward-word-match backward-word-match kill-word-match backward-kill-word-match
zle -N forward-subword forward-word-match
zle -N backward-subword backward-word-match
zle -N forward-kill-subword kill-word-match
zle -N backward-kill-subword backward-kill-word-match
# Make them have standard word behavior, except with subwords active
zstyle ':zle:*-subword*' word-style normal-subword
# Set the characters which can be in words (exclude "-" and "_")
zstyle ':zle:*-subword*' word-chars '*?[]~=&;!#$%^()<>'

bindkey '^[O5D' backward-subword
bindkey '^[O5C' backward-subword

bindkey '^[d' forward-kill-subword
# M-backspace
bindkey '^[^?' backward-kill-subword

foreground-vi() {
	fg %vi || fg
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

after-first-word() {
	zle beginning-of-line
	WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' zle forward-word
}
zle -N after-first-word
bindkey "^X1" after-first-word

_increase_number() {
	local -a match mbegin mend
	[[ $LBUFFER =~ '([0-9]+)[^0-9]*$' ]] &&
		LBUFFER[mbegin,mend]=$(printf %0${#match[1]}d $((10#$match+${NUMERIC:-1})))
}
zle -N increase_number _increase_number
bindkey '^Xa' increase_number
bindkey -s '^Xx' '^[-^Xa'

# Escape trigger vi mode
bindkey '^[' vi-cmd-mode

# History expansion
#  M-. goes back line
#  M-m goes back arguments
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word

autoload -Uz narrow-to-region
function _history-incremental-preserving-pattern-search-backward {
	local state
	MARK=CURSOR
	narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
	zle end-of-history
	zle history-incremental-pattern-search-backward
	narrow-to-region -R state
}
zle -N _history-incremental-preserving-pattern-search-backward
bindkey "^R" _history-incremental-preserving-pattern-search-backward
bindkey -M isearch "^R" _history-incremental-preserving-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# M-= deletes whole path
_backward_kill_default_word() {
	WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' zle backward-kill-word
}
zle -N backward_kill_default_word _backward_kill_default_word
bindkey 'e=' backward_kill_default_word

# Terminate prompt with it to allow nice pasting
nbsp=$'\u00A0'
bindkey -s $nbsp '^u'

# Enhance menu completion
zmodload zsh/complist
zle -C complete-menu menu-select _generic
_complete_menu() {
	setopt localoptions alwayslastprompt
	zle complete-menu
}
zle -N _complete_menu
bindkey '^,' _complete_menu
bindkey -M menuselect '^F' accept-and-infer-next-history
bindkey -M menuselect '/' accept-and-infer-next-history
bindkey -M menuselect '^?' undo
bindkey -M menuselect ' ' accept-and-hold
bindkey -M menuselect '*' history-incremental-search-forward

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey '^F' forward-char

bindkey -s '^Xr' '^A^[d'
bindkey -s '^Xv' '^A^[dvim^M'
