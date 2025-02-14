if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    neofetch --ascii ~/.config/neofetch/paul.txt
end

if not ssh-add -l >/dev/null 2>&1
    eval (keychain --eval --agents "ssh" id_rsa)
end

# Paths
fish_add_path -g ~/bin ~/.local/bin ~/.cargo/env ~/.cargo/bin

# Defaults
set -gx EDITOR hx
set -gx COLORTERM truecolor

# Editing configs
alias editfish="$EDITOR $__fish_config_dir/config.fish"
alias loadfish="source $__fish_config_dir/config.fish"

# WSL configs
if test -n "$WSL_DISTRO_NAME"
    set -gx WINHOME /mnt/c/users/haydenrinn
    fish_add_path -g /mnt/c/Windows
end

# Git aliases
alias gbl="git branch -l"
alias ga="git add"
alias gad="git add ."
alias gct="git commit"
alias gca="git commit --amend"
alias gcs="git commit -s"
alias gst="git status"
alias gpf="git push -f"
alias gp="git push"
alias gbs="git branch --show-current"
alias gr="git rev-parse --show-toplevel"

function gpsu
    git push --set-upstream origin (gbs)
end

function grho
    git reset --hard origin/(gbs)
end

function gar
    # git add repo root
    git add (gr)
end

# Zellij aliases
alias zj="zellij"

function jz
    if test (count $argv) -ne 1
        echo "Usage: jz <target>"
        return 1
    end

    j "$argv[1]"
    zellij action new-tab --cwd (pwd) -n "$argv[1]" --layout compact
    cd -
end

set -gx ATUIN_SESSION (atuin uuid)
set --erase ATUIN_HISTORY_ID

# System aliases
# function cd
#     builtin cd $argv
#     and ls
# end

alias rmzid="rm *Zone.Identifier"

# Atuin init
source $__fish_config_dir/atuin.fish

# Autojump init
if test -f /home/haydenrinn/.autojump/share/autojump/autojump.fish
    . /home/haydenrinn/.autojump/share/autojump/autojump.fish
end

# bootgen global vars
set -gx BOOTGEN $HOME/overlakefw/CastlePeak/build/bootgen/bin/bootgen
set -gx ECDSA_SIGN $HOME/bin/ecdsa-sign

# Bindings
# bind ctrl-o zellij
