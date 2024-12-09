
# sanity check

if [ -z "$BUILD_THREADS" ]; then
	echo "BUILD_THREADS environment variable is not set, so I'm defaulting to 4."
	BUILD_THREADS=4
fi

if [ ! -d "$REPO_DIRECTORY" ]; then
	echo "$REPO_DIRECTORY does not exist so I'm pulling it down from github"

 	# we only need the latest so it's more efficient to add "depth 1"
	git clone --depth 1 ${REPO}
fi

cd $REPO_DIRECTORY

if [ ! -z "$BUILD_CLEAN" ]; then
	echo "BUILD_CLEAN environment variable is defined, so I'm removing the build directory."
	rm -rf ${BUILDDIR}
fi

# if we haven't tried to build before, then we need to configure using cmake
if [ ! -d "$BUILDDIR" ]; then
	mkdir ${BUILDDIR}
	cd ${BUILDDIR}

	CMakeCmd
else
	cd ${BUILDDIR}
fi
#else the user may be wanting to re-build so we don't want to blow away previous stuff

make install -j ${BUILD_THREADS}
