# prompt {
    # modify the prompt to contain git branch name if applicable
    git_prompt_info() {
      current_branch=$(git current-branch 2> /dev/null)
      if [[ -n $current_branch ]]; then
        echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
    fi
    }

    setopt promptsubst
    export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '
# }

# colors {
    # makes color constants available
    autoload -U colors
    colors

    # enable colored output from ls, etc.
    export CLICOLOR=1
# }

# general {
    # source dependencies {
        # aliases
        [[ -f ~/.aliases ]] && source ~/.aliases
    # }

    # unset mailcheck
    unset MAILCHECK
    unsetopt correct_all

    # autocompletion
    autoload -Uz compinit && compinit

    # startup {
        # unicorns n' stuff
        ponysay -q
    # }
# }

# functions {
    # find file under the current directory
    ff () { /usr/bin/find . -name "$@" ; }

     # find a file whose name starts with a given string
    ffs () { /usr/bin/find . -name "$@"'*' ; }

    # find a file whose name ends with a given string
    ffe () { /usr/bin/find . -name '*'"$@" ; }
# }

# plugins {
    source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }
