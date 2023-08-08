#!/usr/bin/env python3

import os

colours = {
    0: "18/18/18",  # base 00
    1: "ab/46/42",  # base 08
    2: "a1/b5/6c",  # base 0b
    3: "f7/ca/88",  # base 0a
    4: "7c/af/c2",  # base 0d
    5: "ba/8b/af",  # base 0e
    6: "86/c1/b9",  # base 0c
    7: "d8/d8/d8",  # base 05
    8: "58/58/58",  # base 03
    9: "ab/46/42",  # base 08
    10: "a1/b5/6c",  # base 0b
    11: "f7/ca/88",  # base 0a
    12: "7c/af/c2",  # base 0d
    13: "ba/8b/af",  # base 0e
    14: "86/c1/b9",  # base 0c
    15: "f8/f8/f8",  # base 7
    16: "dc/96/56",  # base 9
    17: "a1/69/46",  # base 0f
    18: "28/28/28",  # base 1
    19: "38/38/38",  # base 2
    20: "b8/b8/b8",  # base 4
    21: "e8/e8/e8",  # base 6
    "fg": "d8/d8/d8",  # base 05
    "bg": "18/18/18",  # base 00
    "cursor": "d8/d8/d8",  # base 05
}


def termcode(idx, colour):
    tc = ""
    if "TMUX" in os.environ:
        tc = "\x1bPtmux;\x1b\x1b]{idx};rgb:{colour}\x07\x1b\\"
    elif os.getenv("TERM", "").startswith("screen"):
        tc = "\x1bP\x1b]{idx};rgb:{colour}\x07\x1b\\"
    else:
        tc = "\x1b]{idx};rgb:{colour}\x1b\\"
    return tc.format(idx=idx, colour=colour)


def print_tc(idx, colour):
    print(termcode(idx, colour), end="")


for n in range(0, 22):
    print_tc("4;{}".format(n), colours[n])

print_tc(10, colours["fg"])
print_tc(11, colours["bg"])
print_tc(12, colours["cursor"])
