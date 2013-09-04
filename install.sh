#!/bin/bash

if [ "$(dirname $0)" != '.' ]; then
	echo "Run this from the directory it's in."
	exit 1
fi

for file in $(ls -A . | egrep -v '(.git$|install.sh)'); do
	rm -rf ~/"${file}" 2> /dev/null
	cp -rv "$PWD/${file}" ~/"${file}"
done

read -s -p "AES Passphrase: " aes_pass
for file in $(find . -name '*.enc' 2> /dev/null); do
	pre_strip=${file#./}
	echo $aes_pass | openssl enc -d -aes-256-cbc -in ~/"${pre_strip}" -out ~/"${pre_strip%.enc}" -pass stdin
	rm -f ~/"${file}"
done
