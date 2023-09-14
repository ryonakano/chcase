# ChCase
ChCase is a small library to convert case of a given string between camelCase, PascalCase, snake_case, kebab-case, Sentence case, and space-separated.

This is my first attempt to create a library (yet small and straightforward though).

## Usage
### 1. Declare as a Dependency
#### For Flatpak Apps
If you want to use this library in a *flatpaked* app, simply call it as a module:

```yaml
modules:
  - name: chcase
    buildsystem: meson
    sources:
      - type: git
        url: https://github.com/ryonakano/chcase.git
        tag: '2.1.0'
```

Then call `chcase` in your meson file:

```meson
executable(
    meson.project_name(),
    'src/Application.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('chcase')
    ],
    install: true
)
```

Now you can use the library in your project.

#### For Other Packages (e.g. Debian Packaging)
This library is not (yet) provided as a package for any distributions, so the best way to use it to your project is to embed it as a git submodule:

```bash
git submodule add https://github.com/ryonakano/chcase subprojects/chcase
```

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

Now you can use the library in your project.

### 2. Start Coding

Set the case for input string and result string and then perform conversion.

```vala
var converter = new ChCase.Converter.with_case (ChCase.Case.SPACE_SEPARATED, ChCase.Case.CAMEL);
string input_text = "say hello to ChCase";
string output_text = converter.convert_case (input_text);
stdout.printf ("Input: %s / Output: %s\n", input_text, output_text);
// Result
// Input: say hello to ChCase / Output: sayHelloToChCase
```

There is [an example code](examples/Application.vala) prepared in this repository, so it may help you.

## Building and Installation
If you mean to perform code changes and create a pull request against this project, you may want to build and install the library from source code.

You'll need the following dependencies:

* libglib2.0-dev
* meson (>= 0.56.0)
* valac

Run `meson setup` to configure the build environment and run `ninja` to build

```bash
meson setup builddir --prefix=/usr
ninja -C builddir
```

To install, use `ninja install`

```bash
ninja install -C builddir
```

To see a demo app, run:

```bash
./build/examples/example
```
