#!/bin/bash
playlist="$PWD/new.txt"
excludes="$PWD/exclude.txt"

# We'll split this off into a function for the sake of readability.
filtered () {
	#find -type f -iname "*.rar" |grep -vF -f "$excludes"
	find -type f \( -iname "*.rar" -o -iname "*.zip" \) |grep -vF -f "$excludes"
}

[[ -f $playlist ]] && rm "$playlist" && touch "$playlist"

[[ ! -f $excludes ]] && touch "$excludes"

while read file; do
	contents=${file%/*}
    unrar -o- x "$file" "$contents"
	find "$contents/" -type f \( -iname "*.avi" -o -iname "*.mkv" -o -iname "*.mp4" \) |\
		grep -vF -f $playlist|egrep -iv "sample" >> $playlist
	echo $file >> $excludes
done < <(filtered)
