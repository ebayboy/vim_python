#/bin/bash -x
go get -v golang.org/x/tools/gopls
go get -u github.com/jstemmer/gotags
go get -u golang.org/x/tools/...
ln -s $GOPATH  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/
mkdir -p /root/github.com/vim_python/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/bin/
cp /usr/local/go/bin/gopls  /root/github.com/vim_python/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/bin/
