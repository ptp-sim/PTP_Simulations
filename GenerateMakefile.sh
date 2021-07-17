#!/bin/bash
# Create makefile for simulation

# Functions
function verbose () {
    [[ ${VERBOSE} -eq 1 ]] && return 0 || return 1
}

# Parameter evaluation
RELATIVE_CONFIG_FILE_DIR=$1
CONFIG_FILE_NAME=$2
CONFIG=$3

# Path configurations
INET_PATH=~/omnetpp/inet
OMNET_STUFF_PATH=~/ptp
LIBPTP_PATH=${OMNET_STUFF_PATH}/libPTP
PTPSIM_PATH=${OMNET_STUFF_PATH}/PTP_Simulations
UTILS_PATH=${OMNET_STUFF_PATH}/OMNeT_Utils

# Library paths
UTILS_LIBPATH=${UTILS_PATH}/src/OMNeT_Utils
INET_LIBPATH=${INET_PATH}/src/inet
LIBPTP_LIBPATH=${LIBPTP_PATH}/src/libPTP

# NED paths
NED_PATH=""
NED_PATH=${NED_PATH}:${UTILS_PATH}/src
NED_PATH=${NED_PATH}:${INET_PATH}/src
NED_PATH=${NED_PATH}:${LIBPTP_PATH}/src
NED_PATH=${NED_PATH}:${PTPSIM_PATH}/simulations

# Simulation binary
SIM_BIN=${PTPSIM_PATH}/src/PTP_Simulations

# Config file stuff
CONFIG_FILE_DIR=${PTPSIM_PATH}/${RELATIVE_CONFIG_FILE_DIR}


CONFIG_FILE_PATH=${CONFIG_FILE_DIR}/${CONFIG_FILE_NAME}

# Makefile config
MAKEFILE_NAME=Makefile_${CONFIG}
MAKEFILE_PATH=${CONFIG_FILE_DIR}/${MAKEFILE_NAME}

# Command config
CONFIG_LIST_CMD="${SIM_BIN} -g -x ${CONFIG} ${CONFIG_FILE_PATH}"

# Get number of runs
MAX_CONFIG_ID=`${CONFIG_LIST_CMD} | grep Run | cut -d ' ' -f 2 | cut -d ':' -f 1 | tail -n1`

RUNS=0..${MAX_CONFIG_ID}
#RUNS=2

# Verbose output
verbose && ${CONFIG_LIST_CMD}

# Construct simulation command
CMD=${SIM_BIN}
CMD="${CMD} -r ${RUNS}"
CMD="${CMD} -u Cmdenv"
CMD="${CMD} -c ${CONFIG}"
CMD="${CMD} -n ${NED_PATH}"
CMD="${CMD} -l ${UTILS_LIBPATH}"
CMD="${CMD} -l ${INET_LIBPATH}"
CMD="${CMD} -l ${LIBPTP_LIBPATH}"
CMD="${CMD} ${CONFIG_FILE_PATH}"
#CMD="${CMD} --sim-time-limit=10s"

# Generate Makefile
opp_runall --export ${MAKEFILE_PATH} ${CMD}

# Info
echo ${CONFIG_FILE_NAME}, ${CONFIG}, "Highest config ID: " ${MAX_CONFIG_ID}
