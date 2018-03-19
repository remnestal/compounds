#!/bin/bash
# Divide the dictionary into several smaller files; one per leading letter.
# This operation is a little redundant but makes execution more modular
# and, usually, the unix corelibs are well suited for this kind of work

mkdir -p dump/lexicon

# one file per letter in the alphabet
for x in {a..z} ; do
    sed -n '/^'${x}'/p' dump/dictionary.txt > dump/lexicon/${x}
done

# save the best letters for last
export LANG=sv_SE.utf8
sed -n '/^å/p' dump/dictionary.txt > dump/lexicon/å
sed -n '/^ä/p' dump/dictionary.txt > dump/lexicon/ä
sed -n '/^ö/p' dump/dictionary.txt > dump/lexicon/ö
