# Fox stuff
#
# # globbal aliases
alias nv='nvim'
alias nvs='nvim -S ~/.s.vim'
alias nvs2='nvim -S ~/.s2.vim'
alias nvs3='nvim -S ~/.s3.vim'
alias mx='tmux'
alias mxs='tmux new -s'
alias mxa='tmux attach -t'
alias mxd='tmux detach'
alias mxr='tmux rename-session -t'
alias mxk='tmux kill-session -t'
alias ll='ls -l'
alias lh='ls -lah'
alias la='ls -a'
alias cna='npx create-next-app@latest'
PS1='%F{red}%n%f💀-[%F{green}%~%f]$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
