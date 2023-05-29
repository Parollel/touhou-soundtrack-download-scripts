#!/bin/bash

sed -e 's/.*href="\(.*\)">/https:\/\/archive.org\1/' "${1}"| grep '^https'| sed -e 's/\(https:\/\/.*\/\)\([0-9]*\)\(\..*\)/\1\2\3\n\tout=\2.flac/'
