#!/usr/bin/env python3

import sys, os, re

if len(sys.argv) != 2:
    print(f'Usage: {sys.argv[0]} <file>')
    sys.exit(1)

file = sys.argv[1]

with open(file) as f:
    for l in f.readlines():
        parts = l.replace('\n', '')
        parts = re.sub('\[.*\]', '*', parts)
        parts = parts.split('.')
        class_name=parts[len(parts)-2]
        test_name=parts[len(parts)-1]

        print(f'{class_name}.java "{class_name}#{test_name}"')
