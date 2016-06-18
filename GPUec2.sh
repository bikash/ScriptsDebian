 #!/bin/bash


## reference http://tleyden.github.io/blog/2015/11/22/cuda-7-dot-5-on-aws-gpu-instance-running-ubuntu-14-dot-04/


#Install CUDA repository
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb


#Update APT

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y opencl-headers build-essential protobuf-compiler \
    libprotoc-dev libboost-all-dev libleveldb-dev hdf5-tools libhdf5-serial-dev \
    libopencv-core-dev  libopencv-highgui-dev libsnappy-dev libsnappy1 \
    libatlas-base-dev cmake libstdc++6-4.8-dbg libgoogle-glog0 libgoogle-glog-dev \
    libgflags-dev liblmdb-dev git python-pip gfortran

#cleanup
sudo apt-get clean

#DRM module workaround
sudo apt-get install -y linux-image-extra-`uname -r` linux-headers-`uname -r` linux-image-`uname -r`    

#Install CUDA
sudo apt-get install -y cuda
sudo apt-get clean


#install python-pip
sudo apt-get install python-pip python-dev

# Requires CUDA toolkit 7.5 and CuDNN v4. For other versions, see "Install from sources" below. 
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.9.0rc0-cp27-none-linux_x86_64.whl
# Python 2 
sudo pip install --upgrade $TF_BINARY_URL

## check gpu
nvidia-smi

## check tensorflow
# python
# import tensorflow as tf



## write global path in bashrc file
echo  "export PATH=/usr/local/cuda/bin:'$PATH'" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:'$LD_LIBRARY_PATH'" >> ~/.bashrc

## install nltk
sudo pip install -U nltk

## install mumpy
sudo pip install -U numpy


## test code

## install screen for maintaining session
sudo apt-get install screen



## install punkt for nltk type d to choose download and type punkt package and then type q to quit
python nltkPunk.py
#d punkt q



