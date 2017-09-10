#!/bin/sh
#title           : countlines.sh
#description     : Count lines of extansion in repo
#==============================================================================

find . -name '*.py' | xargs wc -l
