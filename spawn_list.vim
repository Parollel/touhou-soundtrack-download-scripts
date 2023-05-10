:%s/.*href="\(.*\)">/https:\/\/archive.org\1
::v/https.*/d
:%s/\(https:\/\/archive\.org\/download\/.*\/\)\([0-9][0-9]\)\(.*\)/\1\2\3\r    out=\2.flac/
