# https://stackoverflow.com/a/246128/13596037
top_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

install_dir=$top_dir/installed
mule_env_dir=$install_dir/mule_env
shumlib_dir=$install_dir/shumlib
unset install_dir
