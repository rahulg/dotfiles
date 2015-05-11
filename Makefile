.NOTPARALLEL:

.PHONY: all sync

TARGETS=sync $(HOME)/tools/cosh

all: $(TARGETS)

sync:
	rsync -av \
	--exclude='.git' \
	--exclude='Makefile' \
	--exclude='LICENSE' \
	. ~

$(HOME)/tools/cosh:
	curl -fsSL https://raw.githubusercontent.com/rahulg/cosh/master/cosh -o $@
	chmod 0755 $@
