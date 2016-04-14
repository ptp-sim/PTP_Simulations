#!/bin/bash
# Generate Makefiles for PTP simulations

# -------------------------------------------------------
# Init
# -------------------------------------------------------
RELATIVE_ROOT_PATH=simulations/PTP
BIN=./GenerateMakefile.sh

# -------------------------------------------------------
# Simple network
# -------------------------------------------------------
RELATIVE_PATH=${RELATIVE_ROOT_PATH}/Simple
CONFIG_NAME=simpleTestNetwork.ini

${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} General
${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} Asymmetry
${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} PI_Parameters
${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} SyncInterval
${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} Unsynced

# -------------------------------------------------------
# DaisyChain network
# -------------------------------------------------------
RELATIVE_PATH=${RELATIVE_ROOT_PATH}/DaisyChain
CONFIG_NAME=daisyChainTestNetwork.ini

${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} General
${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} BoundaryClock_States
${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} SyncInterval

# -------------------------------------------------------
# Ring network
# -------------------------------------------------------
RELATIVE_PATH=${RELATIVE_ROOT_PATH}/Ring
CONFIG_NAME=Ring.ini

${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} General
${BIN} ${RELATIVE_PATH} ${CONFIG_NAME} RingBreak
