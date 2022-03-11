. ./runtime_vars.sh
. ./load_modules.sh

build_root=/tmp/mule_build/
[ -d $build_root ] || mkdir -p $build_root

mule_setuptools_version=45.2.0
mule_commit=44a64bb6d49755cf6fec3d466e8719671e73d130

shumlib_commit=545874fba961deadf4b2758926be7c26f4c8dcb9
shumlib_arch=vm-x86-gfortran-gcc
shumlib_makefile=$shumlib_arch.mk
shumlib_libraries="shum_wgdos_packing shum_byteswap shum_constants shum_spiral_search shum_string_conv shum_wgdos_packing"

