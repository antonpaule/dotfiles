# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geoffgarside"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(copyfile git extract vi-mode common-aliases zsh-syntax-highlighting colored-man-pages)

# User configuration

## PATH variables
export PATH=$HOME/bin:/local_disk/paule/usr/bin:/usr/local/bin:$PATH
export MANPATH=/local_disk/paule/usr/man:/usr/local/man:$MANPATH

# add new maven repo
export PATH=/local_disk/paule/applications/apache-maven-3.6.1/bin:$PATH

# add cmake
export PATH=/local_disk/paule/applications/cmake-3.15.0-Linux-x86_64/bin:$PATH

# add ~/bin
export PATH=~/bin:$PATH

export DOTFILES=$HOME/dotfiles

export LD_LIBRARY_PATH=/local_disk/paule/usr/lib:/opt/dreal/4.19.10.3/lib:/opt/libibex/2.7.4/lib:/usr/local/lib

## Terminal Settings: Ctrl-S, Ctrl-Q diasabled
stty -ixon

## System Editor
export EDITOR=vim

## Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

## Aliases
alias cl=clear
alias ssh='ssh -X -A'
alias cbc='xclip -selection clipboard'
alias cbp='xclip -selection clipboard -o'
alias docker='sudo docker'

## Append other zsh settings at the end
. ${HOME}/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Created by `userpath` on 2019-09-12 08:16:37
export PATH="$PATH:/disk/sim/home/paule/.local/bin"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
