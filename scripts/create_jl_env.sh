

usage="create_jl_env.sh <env_name> <python_path>"

if [ -z "$1"]; then
    echo "Please provide a env name"
fi

env_name="$1"


if [ -z "$2" ]; then 
    py="python3.6"
else
    py="$2"
fi


dir_name="$HOME/.jupyter_kernels"

if [ ! -d dir_name ]; then
    echo "create dir $dir_name"
    mkdir $dir_name
fi

py -m virtualenv "$dir_name/$env_name"

source "$dir_name/$env_name/bin/activate"

python -m pip install jupyterlab
python -m pip install jupyterlab-lsp
python -m pip install 'python-lsp-server[all]'


python -m jupyter labextension install jupyterlab-tailwind-theme
python -m jupyter labextension install jupyterlab-lsp

