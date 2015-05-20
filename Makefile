.NOTPARALLEL:

.PHONY: all sync vim-plugs

TARGETS=sync vim-plugs $(HOME)/tools/cosh

all: $(TARGETS)

sync:
	rsync -av \
	--exclude='.git' \
	--exclude='Makefile' \
	--exclude='LICENSE' \
	. ~

vim-plugs:
	vim +PlugUpgrade +PlugUpdate! +qall

$(HOME)/tools/cosh:
	curl -fsSL https://raw.githubusercontent.com/rahulg/cosh/master/cosh -o $@
	chmod 0755 $@
