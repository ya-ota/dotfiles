#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

/usr/local/bin/brew bundle

/bin/mkdir -p $HOME/dev

