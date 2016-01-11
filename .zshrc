# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep nomatch
unsetopt appendhistory extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt; `%1d` prints the current directory.
# e.g. /some/long/path/name -> boredθname λ
export PS1="boredθ%1d λ "

# Export NeoVim as editor variable
export EDITOR=nvim

# Location of user bin
export MYPATH=$HOME/bin

# Various Golang path variables
export GOPATH=$HOME/gocode
export GOROOT=$HOME/go

# Path to cargo for rustfmt
export CARGOPATH=$HOME/.multirust/toolchains/nightly/cargo/bin

# Export PATH variable
export PATH="$PATH:$MYPATH:$GOPATH/bin:$GOROOT:$GOROOT/bin:$CARGOPATH"

# Node Version Manager stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Stuff for OCaml
# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
