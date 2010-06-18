#!/bin/bash

( [ -z "$1" ] || [ ! -f "$1" ] ) && echo "Bad input" >&2 && exit 1

TEMPFILE=.`date +%s`.tmp
rm -f $TEMPFILE
cp $1 $TEMPFILE
chmod u+w $TEMPFILE

OBJ=`grep -o "@[A-Z]\+@" $TEMPFILE -m 1`
while [ -n "$OBJ" ] ; do
	OBJ=`echo $OBJ | sed "s/@//g"`
	echo "replace $OBJ:" >&2

	case $OBJ in
		DATE ) INPUT=`date +"%Y %b %d"`; echo "$INPUT" >&2;;
		YEAR ) INPUT=`date +"%Y"`; echo "$INPUT" >&2;;
		AUTHOR ) INPUT=`getent passwd $USER | cut -d ':' -f 5 | cut -d ',' -f 1`; echo "$INPUT" >&2;;
		* ) read -e INPUT ;;
	esac

	sed -i -e "s/@$OBJ@/$INPUT/g" $TEMPFILE
	OBJ=`grep -o "@[A-Z]\+@" $TEMPFILE -m 1`
done

cat $TEMPFILE

rm -f $TEMPFILE
