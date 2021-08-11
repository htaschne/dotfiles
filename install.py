#!/usr/bin/env python3

import json
from os import system


def link(src, dst):
    system("ln -sf %s %s" % (src, dst))


with open("link_table.json", "r") as jsonfile:
    data = json.load(jsonfile)

for src, dst in data.items():
    link(src, dst)
