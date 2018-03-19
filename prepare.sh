#!/bin/bash
# combine all dictionaries into one with the following properties
#   - UTF-8 encoded
#   - lowercase
#   - trimmed
#   - does not contain hyphens or punctuations
#   - does not contain diacritics
#   - sorted
#   - unique

mkdir -p dump

cat dictionaries/*                              |\
iconv -f ISO-8859-15 -t UTF-8                   |\
tr '[:upper:]' '[:lower:]'                      |\
tr -d '[:blank:]'                               |\
sed -e 's/Ö/ö/g'                                |\
sed -e 's/Ä/ä/g'                                |\
sed -e 's/Å/å/g'                                |\
sed -r '/^[abcdefghijklmnopqrstuvwxyzåäö]+$/!d' |\
sort                                            |\
uniq                                            \
> dump/dictionary.txt
