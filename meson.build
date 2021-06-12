project('chcase',
    'vala', 'c',
    version: '2.1.0',
    meson_version: '>=0.49.0'
)

pkgconfig = import('pkgconfig')

add_project_arguments(['-W'], language: 'c')

libchcase_deps = [
    dependency('gio-2.0'),
    dependency('glib-2.0')
]

subdir('lib')
subdir('examples')
