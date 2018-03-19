.PHONY: all
all: prepare divide conquer

.PHONY: prepare
prepare:
	bash prepare.sh

.PHONY: divide
divide:
	bash divide.sh

.PHONY: conquer
conquer:
	python conquer.py
