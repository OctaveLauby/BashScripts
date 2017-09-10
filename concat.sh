#!/bin/sh
#title           : concatenate.sh
#description     : Concatenate files in a directory
#==============================================================================


# ----------------------------------------------------------------------------#
# Read arguments

display_help() {
    echo "Usage: $0 -d DIR -o OUT [-r] -- concatenate files."
    echo
    echo "-d, --dir     directory of files"
    echo "-o, --output     output path"
    echo "-r, --regex   regex to filter files"
    echo "-h, --help    display this section"
    echo
    exit 1
}


DIR=
FILTER_REGEX=
PATH_DEST=
FILE_PART="[0-9]\{8\}"
while [[ $# -gt 1 ]]
do
    key="$1"
    case $key in
        -d|--dir)
            DIR="$2"
            shift # past arguments
        ;;
        -o|--output)
            PATH_DEST="$2"
            shift # past arguments
        ;;
        -r|--regex)
            FILTER_REGEX="$2"
            shift # past argument
        ;;
        -h|--help)
            display_help
        ;;
        *)
            echo "Unknown flag $1"
            display_help
        ;;
    esac
    shift # past argument or value
done

[ -z ${DIR} ] && (echo "Missing --dir"; display_help)
[ -z ${PATH_DEST} ] && (echo "Missing --output"; display_help)


# ----------------------------------------------------------------------------#
# Concanate

# Create dir destination dir if necessary
DIR_DEST=$(dirname ${PATH_DEST})
[ -z ${DIR_DEST} ] ||
    [ -d ${DIR_DEST} ] ||
    (mkdir ${DIR_DEST} ; echo "# Create ${DIR_DEST}")

# Remove file if exists
[ -z ${PATH_DEST} ] || rm ${PATH_DEST}

if [ -z ${FILTER_REGEX} ]
then
    FILES=$(find ${DIR}*)
else
    FILES=$(find ${DIR}* | grep "${FILTER_REGEX}")
fi

for FILE in ${FILES}
do
    echo "> Add ${FILE} to ${PATH_DEST}"
    FIRST_COL=$(echo ${FILE} | grep -oe $FILE_PART)
    sed "s#^#${FIRST_COL},#g" ${FILE} >> ${PATH_DEST}
done
