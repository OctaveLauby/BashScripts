#!/bin/sh
#title           : countlines.sh
#description     : Count lines of extansion in repo
#==============================================================================
display_help() {
    echo "Usage: $0 FILE_EXT"
    exit 1
}

[ -z "$1" ] && display_help

FILE_REGEX="*.$1"
echo "Count lines in ${FILE_REGEX} files"
find . -name "${FILE_REGEX}" | xargs wc -l
