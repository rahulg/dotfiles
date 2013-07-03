#!/bin/bash

if [ "$(dirname $0)" != '.' ]; then
	echo "Run this from the directory it's in."
	exit 1
fi

for file in $(ls -A . | egrep -v '(.git$|install.sh)'); do
	rm -rf ~/"${file}" 2> /dev/null
	cp -rv "$PWD/${file}" ~/"${file}"
done
