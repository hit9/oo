set -x OO_ROOT_DIR (realpath (dirname (status -f)))
set -x GOROOT $OO_ROOT_DIR/go
set -x fish_user_paths $OO_ROOT_DIR/bin $GOROOT/bin $fish_user_paths
