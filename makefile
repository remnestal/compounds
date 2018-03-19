.PHONY: all
all: prepare divide

.PHONY: prepare
prepare:
	bash prepare.sh

.PHONY: divide
divide:
	bash divide.sh
