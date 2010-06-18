#!/bin/bash

( [ -z "$2" ] ) && echo "Bad input" >&2 && exit 1

OFILE=./.preboil
if [ -n "$3" ] ; then
	OFILE=$3
fi

[ -f $OFILE ] && sed -i "/$1=/d" $OFILE

echo "$1=$2" >> $OFILE
