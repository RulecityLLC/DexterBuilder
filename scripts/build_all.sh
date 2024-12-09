#!/bin/bash

./build_aux_bootloader.sh
./build_aux_firmware.sh
./build_ldp_abstract.sh
./build_ldp_interpreters.sh
./build_main_bootloader.sh
./build_main_firmware.sh
