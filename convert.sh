#!/bin/bash
# vim:set wrap:

while [[ "$1" != "" ]]; do
    if [ ! -d "$1" ]; then
        printf "\"$1\" is not a directory.\n"
        exit 1
    fi
    mkdir -p "$1/opus"
    declare -i count="$(wc -l "$1/info"| cut -d' ' -f1)"
    artist="$(awk 'NR==1 {print}' "$1/info")"
    album="$(awk 'NR==2 {print}' "$1/info")"
    date="$(awk 'NR==3 {print}' "$1/info")"
    for ((i=4;i<=$count;++i)); do
        file="$(awk -F':' "NR==$i"'{print $1}' "$1/info")"
        title="$(awk -F':' "NR==$i"'{print $2}' "$1/info")"
        ffmpeg -i "$1/$file" -ar 48000 -c:a libopus -vbr on -compression_level 10 -b:a 510K -map_metadata -1 -metadata title="$title" -metadata artist="$artist" -metadata album="$album" -metadata date="$date" -af 'loudnorm=I=-18.5:TP=0:LRA=5' -vn -sn -y "$1/opus/${file%.*}.opus"
    done
    shift
done
