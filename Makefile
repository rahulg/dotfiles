.NOTPARALLEL:

.PHONY: all sync vim-plugs

FORCEINSTALL ?= no

ifeq ($(FORCEINSTALL), yes)
	PLUGUPDATE := !
endif

TARGETS=sync vim-plugs $(HOME)/tools/cosh

all: $(TARGETS)

sync:
	rsync -av \
	--exclude='.git' \
	--exclude='Makefile' \
	--exclude='LICENSE' \
	. ~

vim-plugs:
	vim +PlugUpgrade +PlugUpdate$(PLUGUPDATE) +qall

$(HOME)/tools/cosh:
	curl -fsSL https://raw.githubusercontent.com/rahulg/cosh/master/cosh -o $@
	chmod 0755 $@
