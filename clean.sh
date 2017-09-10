#!/bin/sh
#title           : clean.sh
#description     : This script clean a repository
#==============================================================================

CACHE=
LOGS=
TMP=


display_help() {
    echo "Usage: $0 [-a/-c/-l/-t] -- Delete files from wanted category."
    echo
    echo "-a, --all     clean all"
    echo "-c, --cache   clean cache"
    echo "-l, --logs    clean logs"
    echo "-t, --tmp     clean temporary files"
    echo
    exit 1
}


no_option() {
    echo "$0 is expecting at least one option."
    display_help
}


HAS_OPT=
for FLAG in "$@"
do
    case $FLAG in
        -a | --all)
            HAS_OPT="TRUE"
            CACHE="TRUE"
            LOGS="TRUE"
            TMP="TRUE"
            ;;
        -c | --cache)
            HAS_OPT="TRUE"
            CACHE="TRUE"
            ;;
        -l | --logs)
            HAS_OPT="TRUE"
            LOGS="TRUE"
            ;;
        -t | --tmp)
            HAS_OPT="TRUE"
            TMP="TRUE"
            ;;
        -h | \?)
            HAS_OPT="TRUE"
            display_help
            ;;
        *)
            echo "Invalid Flag $FLAG"
            display_help
    esac
done
[[ -z  ${HAS_OPT} ]] && no_option


[[ ! -z ${CACHE} ]] && rm -rf .cache
[[ ! -z ${TMP} ]] && rm -rf tmp/
[[ ! -z ${LOGS} ]] && rm -rf logs/
