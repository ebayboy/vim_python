#/bin/bash -x
go get -v golang.org/x/tools/gopls
go get -u golang.org/x/tools/...
ln -s $GOPATH  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/
