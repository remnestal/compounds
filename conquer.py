#!/usr/bin/env python3
# encoding=utf8
import sys

from os import listdir
import bisect

LEXICON_PATH = 'dump/lexicon'
lexicon = dict()
result = dict()

# read all dictionary partitions into memory
for letter in listdir(LEXICON_PATH):
    with open('{}/{}'.format(LEXICON_PATH, letter)) as partition:
        content = partition.readlines()
        content = [w.strip() for w in content if len(w) > 1]
        content.sort()
        lexicon[letter] = content

in_lexicon = lambda x: lexicon[x[0]][bisect.bisect(lexicon[x[0]], x)-1] == x

# try separate all words to find reversed compounds
for letter, partition in lexicon.items():
    for word in partition:
        # the word may have already been discovered as a reversed compound
        if word not in result:

            # analyse every possible compound subset
            for i in range(1, len(word)):
                head, tail = word[:i], word[i:]
                reverse = '{}{}'.format(tail, head)

                if not in_lexicon(head) or not in_lexicon(tail):
                    continue
                if in_lexicon(reverse):
                    result[reverse] = (word, reverse)
                    print(result[reverse])
