#!/usr/bin/env bash

function die {
  echo "$1"
  exit 1
}

function usage {
  local prog

  prog=$(basename "$0")
  echo 
  echo "Usage: $prog <repo>"
  echo "  for example $prog <mule>"

  exit 1
}

# validate parameters
[[ $# -eq 1 ]] || usage

# validate credentials
[[ -n "$GITHUB_TOKEN" ]] || die "GITHUB_TOKEN is not defined"

# validate dependencies
which jq > /dev/null || die "jq not found.  Visit https://stedolan.github.io/jq/"

ORG="mulesoft"
HEADER="Authorization: token $GITHUB_TOKEN"
REPO="$1"

URL="https://api.github.com/repos/$ORG/$REPO/pulls?state=open&per_page=100"

username=$(curl -s -H"$HEADER" "https://api.github.com/user" | jq '.login')

result=$(curl -s -H"$HEADER" "$URL")

echo "$result" \
    | jq '.message | contains("Not Found")' > /dev/null 2>&1 \
  && die "$result"

echo "$result" | jq "[.[] | select(.user.login == $username) | \
    { \
      pr: (\"#\" + (.number | tostring) + \": \" + .title), \
      url: .url, \
      state: .state, \
      base: (.base.repo.full_name + \":\" + .base.ref), \
      head: (.head.repo.full_name + \":\" + .head.ref), \
    }]"

