#!/bin/sh


echo "=== BUILDING MULE ==="

set -ex

cd `dirname $0`
. ./setup_compile.sh

cd $build_root
rm -fr mule $mule_env_dir
git clone git@github.com:metomi/mule.git
cd mule
git checkout $mule_commit

python -mvenv --system-site-packages $mule_env_dir
. $mule_env_dir/bin/activate
pip install --upgrade setuptools==$mule_setuptools_version

mkdir -p $(dirname shumlib_dir)

cd um_packing
python setup.py build_ext --inplace -I$shumlib_dir/include -L$shumlib_dir/lib -R$shumlib_dir/lib
python setup.py build
python setup.py install #--prefix=$mule_dir

cd ../mule
python setup.py build
python setup.py install #--prefix=$mule_dir

cd ../um_utils
python setup.py build
python setup.py install #--prefix=$mule_dir

cd ../um_spiral_search
python setup.py build_ext --inplace -I$shumlib_dir/include -L$shumlib_dir/lib -R$shumlib_dir/lib
python setup.py build
python setup.py install #--prefix=$mule_dir
