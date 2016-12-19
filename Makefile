.NOTPARALLEL:

.PHONY: sync test

EXCLUDES = \
	.git \
	Makefile \
	LICENSE

EXCLUDE_FLAGS = $(EXCLUDES:%=--exclude='%')

sync:
	rsync -av $(EXCLUDE_FLAGS) . ~

test:
	rsync -avn $(EXCLUDE_FLAGS) . ~
