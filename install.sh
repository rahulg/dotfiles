#!/bin/bash

if [[ $(dirname $0) != '.' ]]; then
	echo "Run this from the directory it's in."
	exit 1
fi

echo "Copying…"
rsync -av \
	--exclude='.git' \
	--exclude='install.sh' \
	--exclude='.config/fish/local.fish' \
	--exclude='.config/bash/local.bash' \
	. ~

echo "Linking…"
if [[ $(uname -s) == "Darwin" ]]; then
	ln -vfs ~/.DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
fi
