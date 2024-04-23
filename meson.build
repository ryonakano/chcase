project('chcase',
    'vala', 'c',
    version: '2.2.0',
    meson_version: '>=0.56.0'
)

pkgconfig = import('pkgconfig')

add_project_arguments(['-W'], language: 'c')

libchcase_deps = [
    dependency('gio-2.0'),
    dependency('glib-2.0')
]

subdir('lib')

if get_option('demo')
    subdir('examples')
endif

if get_option('doc')
    doc_outdir = 'docs'
    valadoc = find_program('valadoc')

    custom_target(
        'valadoc',
        command: [
            valadoc,
            sources,
            '--package-name=' + meson.project_name(),
            '--package-version=' + meson.project_version(),
            '--verbose',
            '--force',
            '--use-svg-images',
            '-o', meson.project_source_root() / doc_outdir,
        ],

        build_by_default: true,
        output: doc_outdir,
        depends: chcase_lib
    )
endif
