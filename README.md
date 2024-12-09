# DexterBuilder
The repository contains tools to build all Dexter ( http://laserdisc-replacement.com/ ) source code.

Docker ( http://docker.com ) is required and greatly simplifies the build process because you don't need to install a bunch of build tools.

If you don't have Docker installed, I recommend following the instructions at https://docs.docker.com/desktop/ .

# An easy way to just build everything

**NOTE:** You do not need to clone any git repository, including this one (the docker command does it).  Included scripts will automatically download all source code.  You don't need to manually download any source code.

To create binaries in a subdirectory called **DexterOutput**:

## From Linux, MacOS or Windows Powershell
```
docker run --rm -v ${PWD}/DexterOutput:/usr/local/bin -ti mpownby/dexter-builder \
  sh -c "git clone --depth 1 https://github.com/RulecityLLC/DexterBuilder.git && \
  cd DexterBuilder/scripts && \
  ./build_all.sh"
```

## From Windows command line
Replace `${PWD}` from the previous command with `%cd%`.

# Installation

See https://github.com/RulecityLLC/DexterFirmware

# For finer control over the build process

Launch a bash shell by using the above docker command and replacing `./build-all.sh` with `/bin/bash`.

Then you can find and run the individual scripts using `ls`.

To build from a pristine environment, set the BUILD_CLEAN environment variable (to any value).

To specify how many threads you want to use when building, set the BUILD_THREADS environment variable to the count of the threads you want to use.  A default value will be used if not defined.

These can be combined.  For example:
`BUILD_THREADS=6 BUILD_CLEAN=1 ./build_main_bootloader.sh`
