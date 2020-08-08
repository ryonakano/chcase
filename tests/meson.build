test_sources = files(
    'Application.vala'
)

test(
    'tests',
    executable('tests', test_sources, dependencies: libchcase),
    env: ['G_TEST_SRCDIR=' + meson.current_source_dir()]
)
