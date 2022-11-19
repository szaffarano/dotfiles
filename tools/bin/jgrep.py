#!/usr/bin/python

import sys
import os
from zipfile import ZipFile
from zipfile import BadZipfile
import re
from cStringIO import StringIO
from optparse import OptionParser


class Match(object):
    def __init__(self, file, content):
        self.file = file
        self.content = content


def parse_args():
    parser = OptionParser(
        usage="%prog <options>",
        version="0.1",
        description="grep recursivo para archivos zip",
    )

    parser.add_option(
        "-g",
        "--grep",
        dest="grep",
        help="Patron de busqueda en el contenido de los archivos.",
    )
    parser.add_option(
        "-f",
        "--file-pattern",
        dest="filepattern",
        help="Patron de filtrado de archivos dentro del zip.",
    )

    (opts, args) = parser.parse_args()
    options = dict()

    if len(args) != 1:
        print("Numero de argumentos incorrecto.")
    elif not os.path.exists(args[0]):
        print("El archivo %s no existe." % args[0])
    else:
        options["file"] = args[0]
        options["grep"] = re.compile(opts.grep) if opts.grep is not None else None
        options["filepattern"] = (
            re.compile(opts.filepattern) if opts.filepattern is not None else None
        )

        return options

    return None


def match_name(child, options):
    pattern = options["filepattern"]
    return pattern.search(child) if pattern is not None else True


def match_content(child, options):
    grep = options["grep"]
    matched = list()
    if grep is None:
        return matched

    for l in child.readlines():
        if grep.search(l):
            matched.append(l)

    return matched if len(matched) > 0 else None


def search(parent, file, options):
    matches = list()
    for child in file.namelist():
        content = file.open(child).read()
        child_file = StringIO(content)
        try:
            matches.extend(
                search(os.path.join(parent, child), ZipFile(child_file), options)
            )
        except BadZipfile:
            if match_name(child, options):
                matched = match_content(StringIO(content), options)
                if matched is not None:
                    matches.append(Match(os.path.join(parent, child), matched))

    return matches


options = parse_args()

if options is None:
    sys.exit(1)

try:
    zip = ZipFile(open(options["file"]))
except BadZipfile:
    print("%s no es un archivo zip valido!" % file)
    sys.exit(2)


for m in search("", zip, options):
    if len(m.content) > 0:
        print("%s: %s" % (m.file, m.content))
    else:
        print(m.file)
