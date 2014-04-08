#!/bin/bash

if [[ $(dirname $0) != '.' ]]; then
	echo "Run this from the directory it's in."
	exit 1
fi

echo "Copying…"
for file in $(ls -A . | grep -Ev '(.git$|install.sh)'); do
	rm -rf ~/"${file}" 2> /dev/null
	cp -rv "$PWD/${file}" ~/"${file}"
done

echo "Linking…"
if [[ $(uname -s) == "Darwin" ]]; then
	ln -vfs ~/.DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
fi
