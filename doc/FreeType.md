# The FreeType library

The FreeType library version 2.10.4 was compiled for Mac using Xcode 12.1 on macOS 10.15.4 with CMake 3.18.4. The following arguments were passed to CMake:

	-D CMAKE_BUILD_TYPE=Release -D CMAKE_C_FLAGS="${CMAKE_C_FLAGS} -mmacosx-version-min=10.9" -D FT_WITH_ZLIB=ON -D ZLIB_LIBRARY_RELEASE=/path/to/fs2open_repo/build/bin/Release/libzlib.a  -D ZLIB_LIBRARY_DEBUG=${ZLIB_LIBRARY_RELEASE} -D ZLIB_INCLUDE_DIR=/path/to/fs2open_repo/lib/zlib/include -D FT_WITH_BZIP2=OFF -D BZIP2_INCLUDE_DIR= -D FT_WITH_PNG=ON -D PNG_LIBRARY_RELEASE=/path/to/fs2open_repo/bin/Release/libpng.a -D PNG_LIBRARY_DEBUG=${PNG_LIBRARY_RELEASE} -D PNG_PNG_INCLUDE_DIR=/path/to/fs2open_repo/lib/libpng

The `BZIP2_INCLUDE_DIR` variable was set to an empty path to ensure that CMake wouldn't try to use the path provided through Xcode.

The header files were initially in a `freetype2` folder under the `include` folder and were moved up one level.
