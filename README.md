# ChCase
ChCase is a small library to convert case of a given string.

This is my first attempt to create a library (yet small and straightforward though).

## Building, Testing, and Installation
You'll need the following dependencies:

* libglib2.0-dev
* meson
* valac

Run `meson build` to configure the build environment. Change to the build directory and run `ninja` to build

    meson build --prefix=/usr
    cd build
    ninja

To install, use `ninja install`

    sudo ninja install
