#!/bin/bash
if [ $# -eq 0 ]; then
    echo " Usage: " $0 "-f LOGFILE"
    exit 1
fi
while [[ $# > 0 ]]
do
key="$1"

case $key in
    -f|--file)
    FILE="$2"
    shift
    ;;
    *)
    echo " Usage: " $0 "-f LOGFILE"
    exit 1
    ;;
esac
shift
done
if [ ! -f $FILE ]; then
    echo "File not found!: "$FILE
    exit 1
fi
awk -f parse.awk $FILE
