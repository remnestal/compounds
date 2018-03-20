# Compound words

[Compound formation](https://en.wikipedia.org/wiki/Compound_(linguistics)) is very common in the Swedish language and there are many combinations of words that can be reversed to form another correct word; sometimes with a completely different meaning. For some reason [@HerrLantz](https://github.com/HerrLantz) thinks these are really exciting so I wanted to help him find more of them 🔍

But I don't like to think for myself so I made this program to do that for me.

## How-to
Combine the datasets, create the lexicon and find reversed compound words:
```bash
$   make            # defaults to `make all`
```
Or run them separately:
```bash
$   make prepare    # build the combined dataset from source
$   make divide     # divide the dataset into partitions for each letter
$   make conquer    # find reversed compound words using the partitions
```
The combined dictionary ends up in `dump/dictionary.txt` and the partitioned version is created in `dump/lexicon/`

## Swedish dictionaries
All dictionaries are drawn from [Nordic Words](http://runeberg.org/words/) where they reside in the public domain as of **2018-03-19**.

Specifically, the following dictionaries are incorporated:
* [Svenska](http://runeberg.org/words/fr-svenska.txt) by _Projekt Runeberg_
* [ss100.txt](http://runeberg.org/words/ss100.txt) by _Lars Aronsson_
* [ord.niklas.frykholm](http://runeberg.org/words/ord.niklas.frykholm) by _Niklas Frykholm_
* [ord.stava](http://runeberg.org/words/ord.stava) by _swnet & Niklas Frykholm_
* [ord.swnet](http://runeberg.org/words/ord.swnet) by _swnet_

The combined dataset has **306164** entries.

### Encoding
The files stored in the `dictionaries/` subdirectory are encoded as _ISO-8859-1_, which makes **åäö** behave a little weird in some contexts. The dictionary _generated_ by `make prepare` is however encoded as _UTF-8_
