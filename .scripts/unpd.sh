#!/usr/bin/env bash

dirname=${1%.*}
dirname=${dirname##*/}
echo $dirname
if [ -z $2 ]; then
  dirname="$(pwd)/$dirname"
else
  dirname="$2/$dirname"
fi

archivename="$(pwd)/$1"

if ! mkdir "$dirname"; then
  echo "Failed to create directory '$archivename'."
  exit 1
fi

cd $dirname

if ! unp "$archivename"; then
  echo "Failed to unpack '$archivename'."
  cd ..
  rm -rf "$dirname"
  exit 2
else
  cd ..
  exit 0
fi
