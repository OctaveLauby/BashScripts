#!/bin/sh
#title           : 	move_rename.sh
#description     : 	Move and rename files of a directory
# 						files are YYYYMMDD-XXX_file.txt
# 						and becomes YYYY-MM-DD_XXX.csv
#==============================================================================

# do not forget / at the end
DIR_OR="data/"
DIR_DEST="tmp/"
CMD="cp"

REGEX="(\\d{4})(\\d{2})(\\d{2})-(.*)_file.txt"
REPLACE="\\1-\\2-\\3_\\4.csv"


[ -d ${DIR_DEST} ] || (mkdir ${DIR_DEST} ; echo "# Create ${DIR_DEST}")

echo "# $CMD from ${DIR_OR} to ${DIR_DEST}"

for FILE in ${DIR_OR}*
do
	echo "> Processing '${FILE}'"
	FILE_NAME=$(basename ${FILE})
	DEST_NAME=$(
		echo ${FILE_NAME} |
		perl -pe "s#${REGEX}#${REPLACE}#g"
	)
	DEST_PATH="${DIR_DEST}${DEST_NAME}"
	echo "    - $CMD to ${DEST_PATH}"
	$CMD ${FILE} ${DEST_PATH}
done
