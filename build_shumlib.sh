#!/bin/sh

#
#  Make the components of shumlib that are relevant to mule
#
echo "=== BUILDING SHUMLIB ($shumlib_libraries) ==="

set -ex

cd `dirname $0`
. ./setup_compile.sh

cd $build_root
rm -fr shumlib $shumlib_dir
git clone git@github.com:metomi/shumlib.git
cd shumlib
git checkout $shumlib_commit
makefile=make/$shumlib_makefile

echo "Making Shumlib libraries and tests ..."
for lib in $shumlib_libraries
do
    echo "----- making $lib -----"
    make -f $makefile $lib
done

echo "Cleaning up ..."
make -f $makefile clean-temp

echo "Compilation and tests completed"

mkdir -p $shumlib_dir
mv build/$shumlib_arch/* $shumlib_dir/

