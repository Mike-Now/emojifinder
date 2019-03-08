#!/usr/bin/env python3
import os
import sys
import textwrap


def main(emojify_path):
    for idx, line in enumerate(open(emojify_path, 'r')):
        if '[":' not in line:
            continue
        tokens = line.split('"')
        emoji_name = tokens[1]
        emoji = tokens[3]
        emoji_parts = list(filter(bool, emoji.split(r'\U')))
        emoji = ''.join(chr(int(part, 16)) for part in emoji_parts)
        print('%-34s %2s' % (emoji_name, emoji))


def printe(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


def print_usage():
    print(
        textwrap.dedent('''\
    Usage:
        list-emojify.py <path/to/emojify>'''))


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print_usage()
    else:
        try:
            main(sys.argv[1])
        except (TypeError, ValueError):
            printe('Provide path to emojify script!')
            print_usage
            sys.exit(1)
