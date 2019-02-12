#!/bin/bash
term=$1
if [ -z '${term}' ] 
then
  echo 'Missing search term'
  exit 1
fi
export_folder=/tmp
export_file=${export_folder}/`echo ${term} | sed  "s/[^a-z]/_/g"`.qs

# Find the term under current directory.
grep -i -r "${term}" `pwd` > ${export_file}

echo 'Search result saved to file:' ${export_file}

# Copy to your clipboard for Mac user
if hash pbcopy 2>/dev/null; then
  echo -n ${export_file} | pbcopy
  echo '"'${export_file}'"' 'copied to your clipboard.'
fi
