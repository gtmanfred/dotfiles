local base_args="--exclude-dir=CACHE --exclude-dir=ckeditor --binary-files=without-match --colour -Enr"

if [[ $# -eq 1 ]]; then
  grep "${=base_args}" -r "$1 ." 
elif [[ $# -gt 1 ]]; then
  grep "${=base_args}" "$@"
else
  echo "usage: se SEARCH_STRING [FILE_PATTERN]"
fi
