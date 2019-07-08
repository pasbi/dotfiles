#!/bin/bash

# given a directory or file $1, this script searched the file tree towards / until it finds an executable named "build.sh" and executes it.

echo $1
if [[ -d $1 ]]; then
	cd "$1"
  echo "echo $1"
elif [[ -f $1 ]]; then
	cd $(dirname "$1")
  echo "echo $(dirname \"$1\")"
fi
d=`pwd`
echo $d
while [ "`pwd`" != "/" ]; do
	ret=1
	if [[ -x "./build.sh" ]]; then
		./build.sh
		ret=0
		break
	else
		cd ..
	fi
done
cd $d
exit $ret

