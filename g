#!/bin/bash

VERSION='0.0.1'

# 
# Settings
#
MIRROR='https://github.com/golang/go/archive/'  # endswith slash
TAREXT='.tar.gz'  # startswith dot

#
# Docs
#

show_help() {
    cat <<-EOF
Usage: g [COMMAND]

Commands:
  g                           Output versions installed
  g <version>                 Use go <version>
  g use <version>             Use go <version>
  g install <version>         Install go <version>
  g rm <version>              Remove the given verion

Options:
  -v, --version               Output g's version
  -h, --help                  Output this help message
EOF
    exit 0
}

show_version() {
    echo ${VERSION}
    exit 0
}


if test $# -eq 0; then
    show_help
else 
    case $1 in 
        -v|--version) show_version ;;
        -h|--help|help) show_help ;;
    esac
fi
