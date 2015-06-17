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
    ;;
esac
shift
done
awk -f parse.awk $FILE
