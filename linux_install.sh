#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install python3-venv
python3 -m venv ./venv
. ./venv/bin/activate
pip install -r requirements.txt
mkdir ~/.jupyter/
echo "c.NotebookApp.ip = '*'" > ~/.jupyter/jupyter_notebook_config.py

#Install of cuda support
if ! lspci | grep -i nvidia; then
  echo "NVIDIA card found. Install cuda drivers."
  . ./linux_install_cuda.sh
else
  echo "NVIDIA card not found. Skipping cuda drivers."