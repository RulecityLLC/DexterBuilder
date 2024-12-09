#!/bin/bash

REPO_DIRECTORY=DexterFirmware/Bootloader
REPO=https://github.com/RulecityLLC/DexterFirmware.git
BUILDDIR=build-main

CMakeCmd(){
	CC=avr-gcc cmake -DCMAKE_C_FLAGS="-mmcu=atmega644p -Wall -gdwarf-2 -std=gnu99 -DREV3 -DF_CPU=18432000UL -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums" -DCMAKE_C_FLAGS_RELEASE="-Os -DNDEBUG" -DCMAKE_EXE_LINKER_FLAGS="-Wl,--section-start=.text=0xF800" -DCMAKE_BUILD_TYPE=Release ..
}

# fail on any error
set -e

# build it
source common.sh
