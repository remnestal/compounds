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
        content = [w.strip() for w in content]
        content.sort()
        lexicon[letter] = content

# try separate all words to find reversed compounds
for letter, partition in lexicon.items():
    for word in partition:
        # the word may have already been discovered as a reversed compund
        if word not in result:

            # analyse every possible compound subset
            for i in range(1, len(word)):
                head, tail = word[:i], word[i:]
                guess = '{}{}'.format(tail, head)

                # there is a match if the reversed pair is found in the dictionary
                korpus = lexicon[tail[0]]
                idx = bisect.bisect(korpus, guess)
                if korpus[idx-1] == guess:
                    print((word, guess))
