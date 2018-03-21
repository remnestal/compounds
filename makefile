.PHONY: all
all: dictionary prepare divide conquer

.PHONY: dictionary
dictionary:
	bash dictionary.sh

.PHONY: prepare
prepare:
	bash prepare.sh

.PHONY: divide
divide:
	bash divide.sh

.PHONY: conquer
conquer:
	python3 conquer.py > dump/compounds.txt
