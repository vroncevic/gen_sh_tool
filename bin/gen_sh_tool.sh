#!/bin/bash
#
# @brief   Generating Bash tool script
# @version ver.1.0
# @date    Wed May 11 13:00:19 CEST 2016
# @company Frobas IT Department, www.frobas.com 2016
# @author  Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
UTIL_ROOT=/root/scripts
UTIL_VERSION=ver.1.0
UTIL=${UTIL_ROOT}/sh_util/${UTIL_VERSION}
UTIL_LOG=${UTIL}/log

.	${UTIL}/bin/devel.sh
.	${UTIL}/bin/usage.sh
.	${UTIL}/bin/check_root.sh
.	${UTIL}/bin/logging.sh
.	${UTIL}/bin/load_conf.sh
.	${UTIL}/bin/load_util_conf.sh
.	${UTIL}/bin/progress_bar.sh

GEN_SH_TOOL=gen_sh_tool
GEN_SH_TOOL_VERSION=ver.1.0
GEN_SH_TOOL_HOME=${UTIL_ROOT}/${GEN_SH_TOOL}/${GEN_SH_TOOL_VERSION}
GEN_SH_TOOL_CFG=${GEN_SH_TOOL_HOME}/conf/${GEN_SH_TOOL}.cfg
GEN_SH_TOOL_UTIL_CFG=${GEN_SH_TOOL_HOME}/conf/${GEN_SH_TOOL}_util.cfg
GEN_SH_TOOL_LOG=${GEN_SH_TOOL_HOME}/log

declare -A GEN_SH_TOOL_USAGE=(
	[USAGE_TOOL]="${GEN_SH_TOOL}"
	[USAGE_ARG1]="[TNAME] Name of Bash module (file name)"
	[USAGE_EX_PRE]="# Create FileCheck module"
	[USAGE_EX]="${GEN_SH_TOOL} FileCheck"
)

declare -A GEN_SH_TOOL_LOGGING=(
	[LOG_TOOL]="${GEN_SH_TOOL}"
	[LOG_FLAG]="info"
	[LOG_PATH]="${GEN_SH_TOOL_LOG}"
	[LOG_MSGE]="None"
)

declare -A PB_STRUCTURE=(
	[BW]=50
	[MP]=100
	[SLEEP]=0.01
)

TOOL_DEBUG="false"
TOOL_LOG="false"
TOOL_NOTIFY="false"

#
# @brief  Main function 
# @param  Value required name of Bash script module
# @retval Function __gen_sh_tool exit with integer value
#			0   - tool finished with success operation
#			128 - missing argument(s) from cli
#			129 - failed to load tool configuration from files
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# TNAME="FileCheck"
# __gen_sh_tool "$TNAME"
#
function __gen_sh_tool() {
	local TNAME=$1
	if [ -n "${TNAME}" ]; then
		local FUNC=${FUNCNAME[0]} MSG="None" STATUS_CONF STATUS_CONF_UTIL STATUS
		MSG="Loading basic and util configuration!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		__progress_bar PB_STRUCTURE
		declare -A config_gen_sh_tool=()
		__load_conf "$GEN_SH_TOOL_CFG" config_gen_sh_tool
		STATUS_CONF=$?
		declare -A config_gen_sh_tool_util=()
		__load_util_conf "$GEN_SH_TOOL_UTIL_CFG" config_gen_sh_tool_util
		STATUS_CONF_UTIL=$?
		declare -A STATUS_STRUCTURE=(
			[1]=$STATUS_CONF [2]=$STATUS_CONF_UTIL
		)
		__check_status STATUS_STRUCTURE
		STATUS=$?
		if [ $STATUS -eq $NOT_SUCCESS ]; then
			MSG="Force exit!"
			__info_debug_message_end "$MSG" "$FUNC" "$GEN_SH_TOOL"
			exit 129
		fi
		TOOL_DEBUG=${config_gen_sh_tool[DEBUGGING]}
		TOOL_LOG=${config_gen_sh_tool[LOGGING]}
		TOOL_NOTIFY=${config_gen_sh_tool[EMAILING]}
		local UMTOOL=$(echo ${TNAME} | tr 'a-z' 'A-Z') SHTLINE PWD=`pwd` PDIR
		local DATE=$(date) VERSION=${config_gen_sh_tool_util[VERSION]}
		local COMPANY=${config_gen_sh_tool_util[COMPANY]} HASH="#" BCLINE
		local AUTHOR=${config_gen_sh_tool_util[AUTHOR]} UCLINE TAB="	"
		local SCRIPT_TOOL=${config_gen_sh_tool_util[SCRIPT_TOOL]}
		local BASIC_CONFIG=${config_gen_sh_tool_util[BASIC_CONFIG]}
		local UTIL_CONFIG=${config_gen_sh_tool_util[UTIL_CONFIG]}
		local USRID=${config_gen_sh_tool_util[UID]}
		local GRPID=${config_gen_sh_tool_util[GID]}
		local EMAIL=${config_gen_sh_tool_util[EMAIL]}
		MSG="Generating tool folder structure!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		PDIR="${PWD}/${TNAME}"
		mkdir "${PDIR}/"
		mkdir "${PDIR}/bin/"
		mkdir "${PDIR}/conf/"
		mkdir "${PDIR}/log/"
		MSG="Generating Bash script tool!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		GEN_SH_TOOL_LOGGING[LOG_FLAG]="info"
		GEN_SH_TOOL_LOGGING[LOG_MSGE]="$MSG"
		__logging GEN_SH_TOOL_LOGGING
		while read SHTLINE
		do
			eval echo "$SHTLINE" >> "${PDIR}/bin/${TNAME}.sh"
		done < "${GEN_SH_TOOL_HOME}/conf/${SCRIPT_TOOL}"
		MSG="Generating basic configuration file!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		while read BCLINE
		do
			eval echo "$BCLINE" >> "${PDIR}/conf/${TNAME}.cfg"
		done < "${GEN_SH_TOOL_HOME}/conf/${BASIC_CONFIG}"
		MSG="Generating util configuration file!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		while read UCLINE
		do
			eval echo "$UCLINE" >> "${PDIR}/conf/${TNAME}_util.cfg"
		done < "${GEN_SH_TOOL_HOME}/conf/${UTIL_CONFIG}"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		MSG="Set owner!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		eval "chown -R ${USRID}.${GRPID} ${PDIR}/"
		MSG="Set permission!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
		eval "chmod -R 700 ${PDIR}/"
		MSG="Generated bash script tool ${TNAME}"
		GEN_SH_TOOL_LOGGING[LOG_FLAG]="info"
		GEN_SH_TOOL_LOGGING[LOG_MSGE]="$MSG"
		__logging GEN_SH_TOOL_LOGGING
		__info_debug_message_end "Done" "$FUNC" "$GEN_SH_TOOL"
		exit 0
	fi
	__usage GEN_SH_TOOL_USAGE
	exit 128
}

#
# @brief   Main entry point
# @param   Value required script name 
# @exitval Script tool gen_sh_tool exit with integer value
#			0   - tool finished with success operation 
# 			127 - run tool script as root user from cli
#			128 - missing argument(s) from cli
#			129 - failed to load tool configuration from files
#
printf "\n%s\n%s\n\n" "${GEN_SH_TOOL} ${GEN_SH_TOOL_VERSION}" "`date`"
__check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
	__gen_sh_tool $1
fi

exit 127

