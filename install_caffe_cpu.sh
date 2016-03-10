

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


  update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-4.6 30 && \
  update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-4.6 30 && \
  update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 30 && \
  update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 30


cd /opt && git clone https://github.com/BVLC/caffe.git




# Glog
cd /opt && wget https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz && \
  tar zxvf glog-0.3.3.tar.gz && \
  cd /opt/glog-0.3.3 && \
  ./configure && \
  make && \
  make install


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
  make && \
  make install