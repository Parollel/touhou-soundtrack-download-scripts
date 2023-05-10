:%s/.*href="\(.*\)">/https:\/\/archive.org\1
::v/https.*/d
:%s/$/\r    out=.flac/
