#!/bin/bash
# combine all dictionaries into one with the following properties
#   - UTF-8 encoded
#   - trimmed
#   - lowercase
#   - sorted
#   - unique

mkdir -p dump

cat dictionaries/*              |\
iconv -f ISO-8859-15 -t UTF-8   |\
tr -d '[:blank:]'               |\
tr '[:upper:]' '[:lower:]'      |\
sort                            |\
uniq                            \
> dump/dictionary.txt
