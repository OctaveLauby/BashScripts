#!/bin/sh
#title           : logs.sh
#description     : Colored logs for linux
#==============================================================================

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


log() {  # <msg> <lvl> <color>
	if [ -z "$2" ]
	then
		LOGLVL="LVL"
	else
		LOGLVL=$2
	fi
	if [ -z "$3" ]
	then
		COLOR=${WHITE}
	else
		COLOR=$3
	fi

	DATE=$(date "+%FT%T%Z")
	echo "${DATE}: [${LOGLVL}] $(colored_msg $1 ${COLOR})"
}

debug() {  # <msg>
	log $1 DEBUG $RED
}

error() {  # <msg>
	log $1 ERROR $RED
}

fatal() {  # <msg>
	log $1 CRITICAL $RED
}

info() {  # <msg>
	log $1 INFO $BLUE
}

warning() {  # <msg>
	log $1 WARNING $YELLOW
}
