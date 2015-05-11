.NOTPARALLEL:

.PHONY: all sync darwin-link

OSNAME := $(shell uname)

TARGETS=sync $(HOME)/tools/cosh
ifeq ($(OSNAME),Darwin)
	TARGETS+= darwin-link
endif

all: $(TARGETS)

sync:
	rsync -av \
	--exclude='.git' \
	--exclude='Makefile' \
	--exclude='LICENSE' \
	. ~

darwin-link:
	mkdir -p ~/Library/KeyBindings/
	ln -fs ~/.config/darwin/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

$(HOME)/tools/cosh:
	curl -fsSL https://raw.githubusercontent.com/rahulg/cosh/master/cosh -o $@
	chmod 0755 $@
