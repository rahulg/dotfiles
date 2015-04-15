.NOTPARALLEL:

.PHONY: all sync darwin-link

OSNAME := $(shell uname)

TARGETS=sync
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
	ln -fs ~/.config/darwin/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
