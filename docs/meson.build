valadoc = find_program('valadoc')

valadoc_pkgs = []
foreach dep : libchcase_deps
  if not dep.found()
    continue
  endif

  valadoc_pkgs += '--pkg=@0@'.format(dep.name())
endforeach

valadoc_output_dir = 'valadoc'
custom_target(
  'valadoc',
  command: [
    valadoc,
    valadoc_pkgs,
    sources,
    '--package-name=' + meson.project_name(),
    '--package-version=' + meson.project_version(),
    '--verbose',
    '--force',
    '--use-svg-images',
    '-o', valadoc_output_dir,
  ],

  build_by_default: true,
  output: valadoc_output_dir,
  depends: chcase_lib,
)
