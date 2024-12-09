#!/bin/bash

REPO_DIRECTORY=DexterFirmware/Bootloader
REPO=https://github.com/RulecityLLC/DexterFirmware.git
BUILDDIR=build-aux

CMakeCmd(){
	CC=avr-gcc cmake -DCMAKE_C_FLAGS="-mmcu=atmega328p -Wall -gdwarf-2 -std=gnu99 -DREV3 -DPLATFORM_VBI_INJECT -DF_CPU=16000000UL -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums" -DCMAKE_C_FLAGS_RELEASE="-Os -DNDEBUG" -DCMAKE_EXE_LINKER_FLAGS="-Wl,--section-start=.text=0x7800" -DCMAKE_BUILD_TYPE=Release -DBUILD_AUX=1 ..
}

# fail on any error
set -e

# build it
source common.sh
