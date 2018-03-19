#!/bin/bash
# combine all dictionaries into one with the following properties
#   - UTF-8 encoded
#   - does not contain hyphens
#   - does not contain punctuations
#   - does not contain diacritics
#   - trimmed
#   - lowercase
#   - sorted
#   - unique

mkdir -p dump

cat dictionaries/*              |\
iconv -f ISO-8859-15 -t UTF-8   |\
sed -e '/-/d'                   |\
sed -e '/\./d'                  |\
sed -e 's/é/e/g' -e 's/â/a/g'   |\
sed -e 's/à/a/g' -e 's/á/a/g'   |\
tr -d '[:blank:]'               |\
tr '[:upper:]' '[:lower:]'      |\
sort                            |\
uniq                            \
> dump/dictionary.txt
