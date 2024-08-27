#!/bin/bash

read -p "Enter Directory path " dir_path

function renameFiles
{
  n=$(find $dir_path -name "*.txt" | grep -v '.\old_' | wc -l) 
  for i in $(seq 1 $n)
  do
    file=$(find $dir_path -name "*.txt" | grep -v "^old_*" | head -n 1)
    mv $file "$dir_path/old_$(basename "$file")"
  done
}

if [[ -e $dir_path ]]
  then
    if [[ -d $dir_path ]]
      then
        renameFiles
    else
      echo "This is not a directory"
    fi
else
  echo "This path doesn't exist"
fi
