.NOTPARALLEL:

.PHONY: all sync darwin-link

OSNAME := $(shell uname)

ifeq ($(OSNAME),Darwin)
	TARGETS=darwin-link
else
	TARGETS=
endif

all: sync $(TARGETS)

sync:
	rsync -av \
	--exclude='.git' \
	--exclude='Makefile' \
	--exclude='LICENSE' \
	. ~

darwin-link:
	ln -fs ~/.config/darwin/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
