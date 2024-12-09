#!/bin/bash

REPO_DIRECTORY=DexterFirmware/AuxAVR
REPO=https://github.com/RulecityLLC/DexterFirmware.git
BUILDDIR=build-avr

CMakeCmd(){
	CC=avr-gcc cmake -DCMAKE_C_FLAGS="-mmcu=atmega328p -Wall -gdwarf-2 -std=gnu99 -DV3 -DF_CPU=16000000UL -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums" -DCMAKE_BUILD_TYPE=Release ..
}

# fail on any error
set -e

# build it
source common.sh
