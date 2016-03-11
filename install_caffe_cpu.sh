

sudo apt-get update && apt-get install -y \
  bc \
  cmake \
  curl \
  gcc-4.6 \
  g++-4.6 \
  gcc-4.6-multilib \
  g++-4.6-multilib \
  gfortran \
  git \
  libprotobuf-dev \
  libleveldb-dev \
  libsnappy-dev \
  libopencv-dev \
  libboost-all-dev \
  libhdf5-serial-dev \
  liblmdb-dev \
  libjpeg62 \
  libfreeimage-dev \
  libatlas-base-dev \
  pkgconf \
  protobuf-compiler \
  python-dev \
  python-pip \
  unzip \
  wget

sudo  update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-4.6 30 && \
sudo  update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-4.6 30 && \
sudo  update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 30 && \
sudo  update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 30


cd /opt && git clone https://github.com/BVLC/caffe.git




# Glog
cd /opt && wget https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz && \
  tar zxvf glog-0.3.3.tar.gz && \
  cd glog-0.3.3 && \
  ./configure && \
  make 
sudo  make install

sudo ldconfig

# Gflags
cd /opt && \
  wget https://github.com/schuhschuh/gflags/archive/master.zip && \
  unzip master.zip && \
  cd /opt/gflags-master && \
  mkdir build && \
  cd /opt/gflags-master/build && \
  export CXXFLAGS="-fPIC" && \
  cmake .. && \
  make VERBOSE=1 && \
  make
sudo make install


sudo apt-get install -y libgflags-dev

# Build Caffe core
cd /opt/caffe && \
cp Makefile.config.example Makefile.config && \
echo "CPU_ONLY := 1" >> Makefile.config && \ 
echo "CXX := /usr/bin/g++-4.6" >> Makefile.config && \
sed -i 's/CXX :=/CXX ?=/' Makefile 
sudo  make all

# Add ld-so.conf so it can find libcaffe.so
caffe-ld-so.conf /etc/ld.so.conf.d/

# Run ldconfig again (not sure if needed)
sudo ldconfig

# Install python deps
cd /opt/caffe && \
cat python/requirements.txt | xargs -L 1 sudo pip install

# Numpy include path hack - github.com/BVLC/caffe/wiki/Ubuntu-14.04-VirtualBox-VM
ln -s /usr/include/python2.7/ /usr/local/include/python2.7 && \
ln -s /usr/local/lib/python2.7/dist-packages/numpy/core/include/numpy/ /usr/local/include/python2.7/numpy

# Build Caffe python bindings
cd /opt/caffe && make pycaffe


# Make + run tests
cd /opt/caffe && make test && make runtest

