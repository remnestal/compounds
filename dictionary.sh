#!/bin/bash
# Download the word lists used for compound analysis

declare -a dicts=(  "http://runeberg.org/words/fr-svenska.txt"
                    "http://runeberg.org/words/ss100.txt"
                    "http://runeberg.org/words/ord.stava"
                    "http://runeberg.org/words/ord.niklas.frykholm"
                    "http://runeberg.org/words/ord.swnet")

mkdir -p dictionaries
for i in "${dicts[@]}" ; do
   wget ${i} -P dictionaries
done
