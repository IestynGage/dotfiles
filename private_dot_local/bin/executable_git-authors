#!/bin/bash

usage() {
    cat <<EOM
Usage: $(basename $0)

Lists all authors in the current repository..

Homebrew git plugin <https://github.com/IestynGage/terminal/tree/main>

EOM
    exit 1
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  usage
fi

git log --format='%an <%ae>' | sort | uniq