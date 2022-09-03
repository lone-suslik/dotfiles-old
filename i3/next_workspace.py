#!/usr/bin/python

import json, subprocess

output = subprocess.check_output(['i3-msg', '-t', 'get_workspaces'])
workspaces = json.loads(output)

for w in workspaces:
    if w['visible']:
        i = w['num']
        break

if i == 9:
    next_num = 9
else:
    next_num = i + 1

subprocess.call(['i3-msg', 'workspace number %i' % next_num])
