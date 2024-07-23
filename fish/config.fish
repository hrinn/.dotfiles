if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    neofetch --ascii ~/.config/neofetch/paul.txt
end

# Paths
fish_add_path -g ~/bin ~/.local/bin ~/.cargo/env

# Defaults
set -gx EDITOR hx
set -gx COLORTERM truecolor

# Editing configs
alias editfish="$EDITOR $__fish_config_dir/config.fish"
alias loadfish="source $__fish_config_dir/config.fish"

# Git aliases
alias gbl="git branch -l"
alias ga="git add"
alias gad="git add ."
alias gct="git commit"
alias gca="git commit --amend"
alias gst="git status"
alias gpf="git push -f"
alias gp="git push"
alias gbs="git branch --show-current"

function gpsu
    git push --set-upstream origin (gbs)
end

# Zellij aliases
alias zj zellij
set -gx ATUIN_SESSION (atuin uuid)
set --erase ATUIN_HISTORY_ID

# System aliases
function cd
    builtin cd $argv
    ls
end

# Atuin init
source $__fish_config_dir/atuin.fish

# Autojump init
if test -f /home/haydenrinn/.autojump/share/autojump/autojump.fish
    . /home/haydenrinn/.autojump/share/autojump/autojump.fish
end