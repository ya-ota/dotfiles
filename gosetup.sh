#!/usr/bin/env zsh

export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin

go get github.com/nsf/gocode
go get github.com/k0kubun/pp
go get golang.org/x/tools/cmd/godoc
go get github.com/motemen/gore
go get github.com/golang/lint/golint
go get github.com/nsf/gocode
go get github.com/rogpeppe/godef
go get github.com/jstemmer/gotags
go get golang.org/x/tools/cmd/goimports
go get -u github.com/derekparker/delve/cmd/dlv

# if os isnot mac 
#go get github.com/Masterminds/glide

ghq get golang/go

