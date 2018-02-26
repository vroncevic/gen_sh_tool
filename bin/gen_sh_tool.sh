#!/bin/bash
#
# @brief   Generating Bash Tool Script Project
# @version ver.1.0
# @date    Wed May 11 13:00:19 CEST 2016
# @company Frobas IT Department, www.frobas.com 2016
# @author  Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
UTIL_ROOT=/root/scripts
UTIL_VERSION=ver.1.0
UTIL=${UTIL_ROOT}/sh_util/${UTIL_VERSION}
UTIL_LOG=${UTIL}/log

.    ${UTIL}/bin/devel.sh
.    ${UTIL}/bin/usage.sh
.    ${UTIL}/bin/check_root.sh
.    ${UTIL}/bin/check_tool.sh
.    ${UTIL}/bin/logging.sh
.    ${UTIL}/bin/load_conf.sh
.    ${UTIL}/bin/load_util_conf.sh
.    ${UTIL}/bin/progress_bar.sh

GEN_SH_TOOL=gen_sh_tool
GEN_SH_TOOL_VERSION=ver.1.0
GEN_SH_TOOL_HOME=${UTIL_ROOT}/${GEN_SH_TOOL}/${GEN_SH_TOOL_VERSION}
GEN_SH_TOOL_CFG=${GEN_SH_TOOL_HOME}/conf/${GEN_SH_TOOL}.cfg
GEN_SH_TOOL_UTIL_CFG=${GEN_SH_TOOL_HOME}/conf/${GEN_SH_TOOL}_util.cfg
GEN_SH_TOOL_LOG=${GEN_SH_TOOL_HOME}/log

declare -A GEN_SH_TOOL_USAGE=(
    [USAGE_TOOL]="${GEN_SH_TOOL}"
    [USAGE_ARG1]="[TOOL NAME] Name of bash tool script (file/project name)"
    [USAGE_EX_PRE]="# Generating bash tool script FileCheck"
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
#            0   - tool finished with success operation
#            128 - missing argument(s) from cli
#            129 - failed to load tool configuration from files
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# TN="FileCheck"
# __gen_sh_tool "$TN"
#
function __gen_sh_tool {
    local TN=$1
    if [ -n "${TN}" ]; then
        local FUNC=${FUNCNAME[0]} MSG="None"
        local STATUS_CONF STATUS_CONF_UTIL STATUS
        MSG="Loading basic and util configuration!"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        progress_bar PB_STRUCTURE
        declare -A config_gen_sh_tool=()
        load_conf "$GEN_SH_TOOL_CFG" config_gen_sh_tool
        STATUS_CONF=$?
        declare -A config_gen_sh_tool_util=()
        load_util_conf "$GEN_SH_TOOL_UTIL_CFG" config_gen_sh_tool_util
        STATUS_CONF_UTIL=$?
        declare -A STATUS_STRUCTURE=(
            [1]=$STATUS_CONF [2]=$STATUS_CONF_UTIL
        )
        check_status STATUS_STRUCTURE
        STATUS=$?
        if [ $STATUS -eq $NOT_SUCCESS ]; then
            MSG="Force exit!"
            info_debug_message_end "$MSG" "$FUNC" "$GEN_SH_TOOL"
            exit 129
        fi
        TOOL_DEBUG=${config_gen_sh_tool[DEBUGGING]}
        TOOL_LOG=${config_gen_sh_tool[LOGGING]}
        TOOL_NOTIFY=${config_gen_sh_tool[EMAILING]}
        local UTN=$(echo ${TN} | tr 'a-z' 'A-Z') SHL PWD=`pwd` PDIR BCL
        local DATE=$(date) V=${config_gen_sh_tool_util[VERSION]} UCL
        local COMPANY=${config_gen_sh_tool_util[COMPANY]} T="    " H="#"
        local AN=${config_gen_sh_tool_util[AUTHOR_NAME]}
        local AE=${config_gen_sh_tool_util[AUTHOR_EMAIL]}
        local AEMAIL=${config_gen_sh_tool_util[AEMAIL]}
        local USRID=${config_gen_sh_tool_util[UID]}
        local GRPID=${config_gen_sh_tool_util[GID]}
        MSG="Generating tool directory structure!"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        PDIR="${PWD}/${TN}"
        mkdir "${PDIR}/"
        mkdir "${PDIR}/bin/"
        mkdir "${PDIR}/conf/"
        mkdir "${PDIR}/log/"
        local ST=${config_gen_sh_tool_util[SCRIPT_TOOL]}
        local SHF="${PDIR}/bin/${TN}.sh" SHT="${GEN_SH_TOOL_HOME}/conf/${ST}"
        MSG="Generating file [${SHF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        while read SHL
        do
            eval echo "${SHL}" >> ${SHF}
        done < ${SHT}
        local SHET=${config_gen_sh_tool_util[SH_EDIT]}
        local SHETF=$(cat "${GEN_SH_TOOL_HOME}/conf/${SHET}")
        local SHEF="${PDIR}/bin/.editorconfig"
        MSG="Generating file [${SHEF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        echo -e "${SHETF}" > "${SHEF}"
        local BT=${config_gen_sh_tool_util[BASIC_CONFIG]}
        local BCF="${PDIR}/conf/${TN}.cfg"
        local BCT="${GEN_SH_TOOL_HOME}/conf/${BT}"
        MSG="Generating file [${BCF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        while read BCL
        do
            eval echo "${BCL}" >> ${BCF}
        done < ${BCT}
        local CFGET=${config_gen_sh_tool_util[CFG_EDIT]}
        local CFGETF=$(cat "${GEN_SH_TOOL_HOME}/conf/${CFGET}")
        local CFGEF="${PDIR}/conf/.editorconfig"
        MSG="Generating file [${CFGEF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        echo -e "${CFGETF}" > "${CFGEF}"
        local UT=${config_gen_sh_tool_util[UTIL_CONFIG]}
        local UCT="${GEN_SH_TOOL_HOME}/conf/${UT}"
        local UCF="${PDIR}/conf/${TN}_util.cfg"
        MSG="Generating file [${UCF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        while read UCL
        do
            eval echo "${UCL}" >> ${UCF}
        done < ${UCT}
        local TL="${PDIR}/log/${TN}.log"
        MSG="Generating file [${TL}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        touch ${TL}
        local LOGET=${config_gen_sh_tool_util[LOG_EDIT]}
        local LOGETF=$(cat "${GEN_SH_TOOL_HOME}/conf/${LOGET}")
        local LOGEF="${PDIR}/log/.editorconfig"
        MSG="Generating file [${LOGEF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        echo -e "${LOGETF}" > "${LOGEF}"
        MSG="Set owner!"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        eval "chown -R ${USRID}.${GRPID} ${PDIR}/"
        MSG="Set permission!"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_TOOL"
        eval "chmod -R 700 ${PDIR}/"
        MSG="Generated bash script tool ${TN}"
        GEN_SH_TOOL_LOGGING[LOG_FLAG]="info"
        GEN_SH_TOOL_LOGGING[LOG_MSGE]="$MSG"
        logging GEN_SH_TOOL_LOGGING
        info_debug_message_end "Done" "$FUNC" "$GEN_SH_TOOL"
        TREE=$(which tree)
        check_tool "${TREE}"
        STATUS=$?
        if [ $STATUS -eq $SUCCESS ]; then
            eval "${TREE} -L 3 ${PDIR}/"
        fi
        exit 0
    fi
    usage GEN_SH_TOOL_USAGE
    exit 128
}

#
# @brief   Main entry point
# @param   Value required script name 
# @exitval Script tool gen_sh_tool exit with integer value
#            0   - tool finished with success operation
#            127 - run tool script as root user from cli
#            128 - missing argument(s) from cli
#            129 - failed to load tool configuration from files
#
printf "\n%s\n%s\n\n" "${GEN_SH_TOOL} ${GEN_SH_TOOL_VERSION}" "`date`"
check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
    __gen_sh_tool $1
fi

exit 127

