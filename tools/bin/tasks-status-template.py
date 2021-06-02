#!/usr/bin/env python3

# based on https://frostyx.cz/posts/vimwiki-diary-template

import sys
import os
from datetime import datetime, timedelta, date

template = """## For today | @work state:planned

## Done yesterday | @work status:completed end:{date}

## Notes"""

delta = timedelta(days=1)

if len(sys.argv) < 2:
    current = date.today()
else:
    raw_date = os.path.splitext(os.path.basename(sys.argv[1]))[0]
    current = datetime.strptime(raw_date, '%Y-%m-%d')

yesterday = current - delta

print(template.format(date=yesterday.strftime('%Y-%m-%d')))
