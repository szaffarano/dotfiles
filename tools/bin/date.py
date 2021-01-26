#!/usr/bin/env python3

import datetime
import re
import sys
import os

#
# This script reads a jenkins `consoleOutput` file to analyze the downloaded
# files during the run, and how long it took.  
#

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Expected file to parse')
        sys.exit(1)

    name = sys.argv[1]
    if not os.path.isfile(name):
        print(f'{name}: not found')

    downloading_re = re.compile('.*\[(202..*Z)\].*Downloading.*(http.*)')
    downloaded_re = re.compile('.*\[(202..*Z)\].*Downloaded.*(http.*)\ \(.*')
    date_mask = '%Y-%m-%dT%H:%M:%S.%fZ'

    total = 0
    artifacts = {}
    with open(name) as f:
        for line in f.readlines():
            line = line.replace('\n', '').replace('\r', '')

            downloaded = downloaded_re.match(line)
            downloading = downloading_re.match(line)

            if downloaded:
                date = datetime.datetime.strptime(downloaded.groups()[0] , date_mask)
                artifact = downloaded.groups()[1]

                start = artifacts.get(artifact)
                if start is not None:
                    total = total + (date-start).total_seconds()
                else:
                    print(f'WARNING: "{artifact}" not registered')
            elif downloading:
                date = datetime.datetime.strptime(downloading.groups()[0] , date_mask)
                artifact = downloading.groups()[1]
                artifacts[artifact] = date
                print(artifact)

    print (f'Total: {total/60} minutes ({len(artifacts)} downloaded)')
