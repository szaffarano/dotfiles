#!/bin/bash
which sdk 2>&1 /dev/null || (cd && curl -s "https://get.sdkman.io" | bash)
