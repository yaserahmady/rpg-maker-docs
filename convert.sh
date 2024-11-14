#!/bin/bash

rm -rf ./2000 ./2003
archmage -x ./chm/rpg2000.chm "./2000"
archmage -x ./chm/rpg2003.chm "./2003"

find . -type f -name "*.htm" -exec sh -c '
  f="{}"
  iconv --from-code=ISO-8859-1 --to-code=UTF-8 -- "$f" > "$f".tmp
  mv -v -- "$f".tmp "$f"
  ' \;

# Delete all files starting with # cause they break Netlify
find . -type f -name "#*" -exec rm -f {} \;
