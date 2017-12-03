sudo apt-get -y install python3-venv
python3 -m venv ./venv
. ./venv/bin/activate
pip install -r requirements.txt
mkdir ~/.jupyter/
echo "c.NotebookApp.ip = '*'" > ~/.jupyter/jupyter_notebook_config.py