# __     __                      _             _     
# \ \   / /                     (_)           ( )    
#  \ \_/ /__  _   _ _ __   __ _  _ _   _ _ __ |/ ___ 
#   \   / _ \| | | | '_ \ / _` || | | | | '_ \  / __|
#    | | (_) | |_| | | | | (_| || | |_| | | | | \__ \
#    |_|\___/ \__,_|_| |_|\__, || |\__,_|_| |_| |___/
#                          __/ |/ |                  
#    ______ _____ _    _ _|___/__/____               
#   |___  // ____| |  | |  __ \ / ____|              
#      / /| (___ | |__| | |__) | |                   
#     / /  \___ \|  __  |  _  /| |                   
#  _ / /__ ____) | |  | | | \ \| |____               
# (_)_____|_____/|_|  |_|_|  \_\\_____|    	
										 

#Ascii art font: ""big""
#https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20



autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' '%b
#echo "\ue0a0" will give you that icon.
precmd() { 
vcs_info 
}

setopt prompt_subst
#PROMPT='%F{011}%f %U%F{yellow}%~%f%u %F{blue}${vcs_info_msg_0_} %f$ '
#PROMPT='%F{011}%f%F{blue}${vcs_info_msg_0_} %f> '
PROMPT='%F{011} %f%F{#FFFF00}$ '
#PROMPT="%F{011}> %f %U%F{yellow}%~%f%u %F{blue}${vcs_info_msg_0_}$%f "

#PROMPT="%F{011}> %f%U%F{yellow}%f%u%F{blue}$%f "
#RPROMPT="%F{241}%T%f"



# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

#Use vim keys in tab complete meunu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
tmp="$(mktemp)"
lf -last-dir-path="$tmp" "$@"
if [ -f "$tmp" ]; then
	dir="$(cat "$tmp")"
	rm -f "$tmp"
	[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
fi
}
bindkey -s '^o' 'lfcd\n'

# ____  _      ____   ____  _____
# /    || |    |    | /    |/ ___/
#|  o  || |     |  | |  o  (   \_ 
#|     || |___  |  | |     |\__  |
#|  _  ||     | |  | |  _  |/  \ |
#|  |  ||     | |  | |  |  |\    |
#|__|__||_____||____||__|__| \___|

# - permenant alias
alias ls='ls --color'
alias c='clear'
alias v='vim'
alias zcon='vim +95 ~/.zshrc'
alias scon='source ~/.zshrc'
alias vcon='vim ~/.vimrc'
alias jbin='cd ~/bin'
alias yr='brew services restart yabai'
alias bl='brew services list'
alias jc='cd ~/coding'
alias jl='cd /Users/jun/myjun/mystudy/leetCode'
alias prac='cd /Users/jun/myprac/'
alias ob='cd /Users/jun/mybrain'
# - temporary alias
alias jr='cd /Users/jun/myjun/mystudy/mypl/rust'
alias dsa='cd /Users/jun/mybrain/c.\ resource/dsa_tutor'
alias snip='cd /Users/jun/.vim/Ultisnips'
alias gool='ssh ypark26@unix1.csc.calpoly.edu'
alias cw1='cd /Users/jun/myjun/myschool/cpe464/prog1'
alias cw2='cd /Users/jun/myjun/myschool/data301'
 
alias tb1='open http://intronetworks.cs.luc.edu/current/html/'
alias prog2='vim /Users/jun/myjun/myschool/cpe464/prog2/prog2.md' 
alias bellardo='open https://users.csc.calpoly.edu/~bellardo/courses/2238/464/index.php'
export EDITOR=vim
export VISUAL="$EDITOR"

source /Users/jun/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source /Users/jun/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview= 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

