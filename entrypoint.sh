#!/usr/bin/env bash

#set -x

paths_arr=( "$@" )
printf "\n========== List modified files: ( %s ) ==========\n" "${paths_arr[*]}"
git diff --name-only HEAD^ HEAD

printf "\n========== Check paths of modified files ==========\n"
[[ -n "${GITHUB_ACTIONS}" ]] && git config --global --add safe.directory /github/workspace 
git rev-parse HEAD
git diff --name-only HEAD^ HEAD > files.txt
matched=false
while IFS= read -r file
do
  for path in ${paths_arr[*]}
  do
      if [[ $file == $path* ]]; then
        echo "$file - match path: $path"
        matched=true
        break
      fi
  done
  if [[ $matched == true ]]; then
      break
  else
      echo "$file - does not match any given path"
  fi
done < files.txt
rm -rf files.txt

printf "\n========== Result ==========\n"
if [[ $matched = true ]]; then
  echo "match found"
  echo "matched=true" >> $GITHUB_OUTPUT
else
  echo "no match found"
  echo "matched=false" >> $GITHUB_OUTPUT
fi
