
### Git completion

  source ~/.git-completion.bash

# Run this command to configure your shell:
# eval "$(docker-machine env dev)"


# echo is like puts for bash (bash is the program running in your terminal)
# echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"

# $VARIABLE will render before the rest of the command is executed
# echo "Logged in as $USER at $(hostname)"

# Load RVM into a shell session *as a function*
# Rbenv autocomplete and shims
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PATH
  # Path for RBENV
  test -d $HOME/.rbenv/ && PATH="$HOME/.rbenv/bin:$PATH"

  # path for brew

    test -d /usr/local/bin && export PATH="/usr/local/bin:~/bin:$PATH"

  # path for heroku

    test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

  # path notes
    # Path order matters, putting /usr/local/bin: before $PATH
    # ensures brew programs will be seen and used before another program
    # of the same name is called

    # Path changes are made non-destructive with PATH=new_path;$PATH   This is like A=A+B so we preserve the old path
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"


# neighborly

  # path for demeter
  export PATH="/Users/derek/dev/neighborly/demeter:$PATH"

  # aliases
    alias d="docker"
    alias dm="docker-machine"
    alias dc='docker-compose'
    alias de="demeter"
    alias em="ember"
    alias es="ember serve"
    alias ets="ember test --server"

# git tab-completion

  if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
  fi

# prompt
  # default colors
    # \[\e[0m\] resets the color to default color
    c_reset='\[\e[0m\]'
    #  \e[0;31m\ sets the color to red
    c_path='\[\e[0;31m\]'
    # \e[0;32m\ sets the color to green
    c_git_clean='\[\e[0;32m\]'
    # \e[0;31m\ sets the color to red
    c_git_dirty='\[\e[0;31m\]'

  # Colors ls should use for folders, files, symlinks etc, see `man ls` and
    # search for LSCOLORS
    export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
    # Force ls to use colors (G) and use humanized file sizes (h)
    alias ls='ls -Gh'

    # Force grep to always use the color option and show line numbers
    export GREP_OPTIONS='--color=always'


  # default prompt
    FANCY="\342\236\234 "
    PROMPT_COMMAND='PS1="[ ${c_path}\W${c_reset}$(git_prompt) ] $FANCY " '

  # PS1 is the variable for the prompt you see everytime you hit enter

    export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# git prompt
  # determines if the git branch you are on is clean or dirty
  git_prompt ()
  {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
      return 0
    fi
    # Grab working branch name
    git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    # Clean or dirty branch
    if git diff --quiet 2>/dev/null >&2; then
      git_color="${c_git_clean}"
    else
      git_color=${c_git_dirty}
    fi
    echo " @ $git_color$git_branch${c_reset}"
  }

# Set sublime as the default editor

  which -s subl && export EDITOR="subl --wait"

# aliases
  alias e=subl
  alias serve='python -m SimpleHTTPServer'
  alias be='bundle exec'
  alias bi='bundle install'
  alias bake='be rake'
  alias jake='be rake'
  alias resetdb='bake db:drop && bake db:create && bake db:migrate && bake db:seed'
  alias setdb='bake db:create && bake db:migrate && bake db:seed'
  alias bspec='be rspec'
  alias ..='cd ../'
  alias ...='cd ../../'
  alias .3='cd ../../../'
  alias .4='cd ../../../../'
  alias .5='cd ../../../../../'
  alias .6='cd ../../../../../../'
  alias f='open -a Finder ./'
  alias ~="cd ~"
  alias c='clear'
  mcd () { mkdir -p "$1" && cd "$1"; }
  showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

  export NVM_DIR="/Users/derek/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  alias renew="sudo ipconfig set en0 BOOTP && sudo ipconfig set en0 DHCP"

#source ~/dev/neighborly/demeter/.profile
