#!/bin/sh
#title           : logs.sh
#description     : Colored logs for linux
#==============================================================================

# ----------------------------------------------------------------------------#
# Colors

WHITE="\e[39m"

RED="\e[31"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"

LRED="\e[91m"
LGREEN="\e[92m"
LYELLOW="\e[93m"
LBLUE="\e[96m"  # Actually Cyan


colored_msg() {  # <msg> <color>
    echo "$2$1$WHITE"
}


# ----------------------------------------------------------------------------#
# Log Level

LOGLVL=20

set_debug() {
	LOGLVL=10	
}
set_info() {
	LOGLVL=20	
}
set_warning() {
	LOGLVL=30	
}
set_error() {
	LOGLVL=40	
}
set_fatal() {
	LOGLVL=50	
}

# ----------------------------------------------------------------------------#
# Log Display

log() {  # <msg> <lvl> <color>
	if [ -z "$2" ]
	then
		LOGLABEL="LVL"
	else
		LOGLABEL=$2
	fi
	if [ -z "$3" ]
	then
		COLOR=${WHITE}
	else
		COLOR=$3
	fi

	DATE=$(date "+%FT%T%Z")
	echo "${DATE}: [${LOGLABEL}] $(colored_msg $1 ${COLOR})"
}

debug() {  # <msg>
	if [ "${LOGLVL}" -le "10" ]
	then
		log $1 DEBUG $RED
	fi
}

info() {  # <msg>
	if [ "${LOGLVL}" -le "20" ]
	then
		log $1 INFO $BLUE
	fi
}

warning() {  # <msg>
	if [ "${LOGLVL}" -le "30" ]
	then
		log $1 WARNING $YELLOW
	fi
}

error() {  # <msg>
	if [ "${LOGLVL}" -le "40" ]
	then
		log $1 ERROR $RED
	fi
}

fatal() {  # <msg>
	if [ "${LOGLVL}" -le "50" ]
	then
		log $1 CRITICAL $RED
	fi
}
