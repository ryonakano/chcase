sources = files(
    'Case.vala',
    'Converter.vala',
)

chcase_lib = library(
    'chcase',
    sources,
    dependencies: libchcase_deps,
    vala_header: 'chcase.h',
    install: true,
    install_dir: [true, true, true]
)

install_data(
    'chcase.deps',
    install_dir: join_paths(get_option('datadir'), 'vala', 'vapi')
)

libchcase = declare_dependency(
    dependencies: libchcase_deps,
    include_directories: include_directories('.'),
    link_with: chcase_lib
)

chcase_pc = pkgconfig.generate(
    chcase_lib,
    name: 'chcase',
    requires: libchcase_deps,
    subdirs: ['chcase'],
    description: 'A small library to convert case of a given string',
    version: meson.project_version(),
    url: 'https://github.com/ryonakano/chcase',
)
