
# 1. Source venv

# 2. Install deps
pip install jupyterlab ipywidgets

# 3. Add venv to kernels

python -m ipython kernel install --name "local-venv" --user


# List kernels
jupyter kernelspec remove <kernel-name>

