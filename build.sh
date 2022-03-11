#!/bin/sh

set -e

cd `dirname $0`

./build_shumlib.sh
./build_mule.sh

