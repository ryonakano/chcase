# ChCase
ChCase is a small library to convert case of a given string.

This is my first attempt to create a library (yet small and straightforward though).

## Example
You can convert your text between camelCase, PascalCase, snake_case, kebab-case, and space-separated.

Set the case for input string and result string and then perform conversion.

```vala
var converter = new ChCase.Converter.with_case (ChCase.Case.SPACE_SEPARATED, ChCase.Case.CAMEL);
string input_text = "say hello to ChCase";
string output_text = converter.convert_case (input_text);
```

Compile with:

    valac --pkg chcase *.vala

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
