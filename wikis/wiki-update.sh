#!/bin/bash

cd $(dirname $0)

IFS=$'\n'
files=$(find "$(pwd -P)" -type f -name "*.md" -printf '"%p"\n' | sort)
TARGET=../webs/wikis.js

echo "var wikiLists = [" > $TARGET
for f in $files
do
	echo "{url: ${f} , title: \"$(basename ${f%.*})\"}," >> $TARGET
done
echo "];" >> $TARGET
