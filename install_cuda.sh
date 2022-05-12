echo "***** Removing previous installation *****"
sudo apt-key list
sudo rm /etc/apt/sources.list.d/cuda*
sudo apt remove --autoremove nvidia-cuda-toolkit
sudo apt-get purge nvidia*
sudo apt-get autoremove
sudo apt-get autoclean
sudo rm -rf /usr/local/cuda*

echo "***** Before the installation *****"
sudo apt-get -y install linux-headers-$(uname -r)

echo "***** Installing CUDA, NVIDIA Driver *****"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt -y update
sudo apt -y install cuda-11-1

# echo "***** Installing CUDA Toolkit *****"
# sudo apt install -y nvidia-cuda-toolkit

# echo "***** Installing cuDNN *****"
# wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb
# sudo dpkg -i nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb
# sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" >> /etc/apt/sources.list.d/nvidia-machine-learning.list'
# sudo apt -y install libcudnn8=8.0.5.*-1+cuda11.1 libcudnn8-dev=8.0.5.*-1+cuda11.1

# echo 'export PATH=/usr/local/cuda-11.1/bin${PATH:+:${PATH}}' >> ~/.bashrc
# echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.1/lib64' >> ~/.bashrc
# source ~/.bashrc

# echo "***** Successfully Installed! *****"
# echo $PATH
# echo $LD_LIBRARY_PATH
