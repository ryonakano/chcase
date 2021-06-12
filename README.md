# ChCase
ChCase is a small library to convert case of a given string between camelCase, PascalCase, snake_case, kebab-case, Sentence case, and space-separated.

This is my first attempt to create a library (yet small and straightforward though).

## Usage
This library is not (yet) provided as a package for any distributions, so the best way to use it to your project is to embed it as a git submodule:

    git submodule add https://github.com/ryonakano/chcase subprojects/chcase

Load the embeded chcase library as a dependency in the root `meson.build`:

```meson
chcase_subproject = subproject('chcase')
chcase_deps = chcase_subproject.get_variable('libchcase')
```

Add the loaded `chcase_deps` in the dependencies list in `meson.build` that has `executable` method:

```meson
executable(
    meson.project_name(),
    'src/Application.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        chcase_deps,
    ],
    install: true
)
```

Now you can use chcase in your project.

Set the case for input string and result string and then perform conversion.

```vala
var converter = new ChCase.Converter.with_case (ChCase.Case.SPACE_SEPARATED, ChCase.Case.CAMEL);
string input_text = "say hello to ChCase";
string output_text = converter.convert_case (input_text);
stdout.printf ("Input: %s / Output: %s\n", input_text, output_text);
// Result
// Input: say hello to ChCase / Output: sayHelloToChCase
```

## Building and Installation
If you mean to perform code changes and create a pull request against this project, you may want to build and install the library from source code.

You'll need the following dependencies:

* libglib2.0-dev
* meson (>= 0.49.0)
* valac

Run `meson build` to configure the build environment. Change to the build directory and run `ninja` to build

    meson build --prefix=/usr
    cd build
    ninja

To install, use `ninja install`

    ninja install

To see a demo app, run:

    ./build/examples/example
