#!/bin/bash

cd $(dirname $0)

IFS=$'\n'
TARGET=../webs/wikis.js

# os detection for linux vs macos (bsd vs gnu find)
find_base="find \"$(pwd -P)\" -type f -name \"*md\" -print"
find_linux="f '\"%p\"\n'"
find_macos="0 | xargs -0 stat -f '%N'"
case $(uname -s) in
    Linux*)     find_cmd="$find_base$find_linux | sort";;
    Darwin*)    find_cmd="$find_base$find_macos | sort";;
    *)          echo "os not supported...(yet)";exit -1;;
esac

files=$(eval $find_cmd)

echo "var wikiLists = [" > $TARGET
for f in $files
do
	echo "{url: ${f} , title: \"$(basename ${f%.*})\"}," >> $TARGET
done
echo "];" >> $TARGET
