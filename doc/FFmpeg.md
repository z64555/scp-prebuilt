# The FFmpeg libraries

The FFmpeg libraries should be compiled with a configure line similar to this one:

    --disable-programs --disable-doc --disable-avdevice --disable-postproc --disable-avfilter --disable-network --disable-encoders --disable-hwaccels --disable-muxers
    
On Mac you have to add `--install-name-dir="@executable_path/../Frameworks" --disable-vda` to make sure that the libraries work with FSO.

Vorbis and Theora are required but everything else can be removed. For Windows builds the script in [this repository](https://github.com/rdp/ffmpeg-windows-build-helpers) can be used. It allows to cross-compile everything that is needed from a Linux machine using MinGW. You will have to adjust the configure line to reduce the size of the libraries since the default version includes everything there is and that is way to much for us.
