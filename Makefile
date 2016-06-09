.NOTPARALLEL:

.PHONY: sync

sync:
	rsync -av \
	--exclude='.git' \
	--exclude='Makefile' \
	--exclude='LICENSE' \
	. ~
