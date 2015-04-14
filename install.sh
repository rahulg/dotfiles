#!/bin/bash

set -e -u

if [[ $(dirname $0) != '.' ]]; then
	echo "Run this from the directory it's in."
	exit 1
fi

echo "Copying…"
rsync -av \
	--exclude='.git' \
	--exclude='install.sh' \
	--exclude='LICENSE' \
	. ~

if [[ $(uname -s) == "Darwin" ]]; then
	echo "Linking…"
	ln -vfs ~/.config/darwin/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
fi
