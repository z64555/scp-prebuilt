# The FFmpeg libraries

The FFmpeg libraries should be compiled with a configure line similar to this one:

    --disable-programs --disable-doc --disable-avdevice --disable-postproc --disable-avfilter --disable-network --disable-encoders --disable-hwaccels --disable-muxers

On Mac you have to add `--install-name-dir="@executable_path/../Frameworks" --prefix=/usr/local/ffmpeg  --extra-cflags='-mmacosx-version-min=10.9' --extra-ldflags='-mmacosx-version-min=10.9' --pkg-config-flags=--static --enable-shared --disable-static --disable-vda` to make sure that the libraries work with FSO.  Then just replace the ffmpeg in a downloaded and extracted prebuilt lib archive with the ffmpeg folder at /usr/local/ffmpeg (or wherever you chose for a prefix), and configure CMake with -DFSO_PREBUILT_OVERRIDE=/path/to/custom/prebuilt.  For a debug build, you also need to add `--disable-stripping --disable-optimizations --disable-mmx --enable-debug=3`.  To extract the debug symbols into dSYM files for use with Xcode's debugger, cd to the ffmpeg install directory and run `find . -name '*.dylib' | xargs -I {} dsymutil `basename {}` -o "{}.dSYM"`.

Vorbis and Theora are required but everything else can be removed. For Windows builds the script in [this repository](https://github.com/rdp/ffmpeg-windows-build-helpers) can be used. It allows to cross-compile everything that is needed from a Linux machine using MinGW. You will have to adjust the configure line to reduce the size of the libraries since the default version includes everything there is and that is way to much for us.
