ID=$RANDOM
TMP_PATH="/tmp/${ID}/"
echo $TMP_PATH
mkdir $TMP_PATH
sudo apt-get -y install build-essential

#wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
#sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64=deb
#sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
#sudo apt-get update
#sudo apt-get install cuda

wget -P $TMP_PATH http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo dpkg -i ${TMP_PATH}cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda-8-0

#wget klusacek.tk/~honza/data_archive/cudnn-8.0-linux-x64-v7.tgz
wget -P $TMP_PATH klusacek.tk/~honza/data_archive/cudnn-8.0-linux-x64-v6.0.tgz
tar -zxf ${TMP_PATH}cudnn-8.0-linux-x64-v6.0.tgz -C ${TMP_PATH}

sudo mkdir -p /usr/local/cuda/lib64/
sudo mkdir -p /usr/local/cuda/include/
echo sudo cp ${TMP_PATH}cuda/lib64/* /usr/local/cuda/lib64/
echo sudo cp ${TMP_PATH}cuda/include/* /usr/local/cuda/include/
# CUDA Toolkit
echo "export CUDA_HOME=/usr/local/cuda-8.0" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export PATH=${CUDA_HOME}/bin:${PATH}" >> ~/.bashrc

#configure right speed
sudo nvidia-smi -pm 1
