sources = files(
    'Case.vala',
    'Converter.vala',
)

chcase_lib = library(
    'libchcase',
    sources,
    dependencies: libchcase_deps,
    vala_header: 'libchcase.h',
    install: true,
    install_dir: [true, true, true]
)

install_data(
    'libchcase.deps',
    install_dir: join_paths(get_option('datadir'), 'vala', 'vapi')
)

libchcase = declare_dependency(
    dependencies: libchcase_deps,
    include_directories: include_directories('.'),
    link_with: chcase_lib
)

chcase_pc = pkgconfig.generate(
    chcase_lib,
    name: 'libchcase',
    requires: libchcase_deps,
    subdirs: ['libchcase'],
    description: 'A small library to convert case of a given string',
    version: meson.project_version(),
    url: 'https://github.com/ryonakano/chcase',
)
