 #!/bin/bash
 sudo apt-get install python-scipy libblas-dev liblapack-dev gfortran
sudo apt-get install libffi-dev  # for cryptography from scrapy
sudo apt-get install libxslt-dev  # for libxml from scrapy
export BLAS=/usr/lib/libblas.so
export LAPACK=/usr/lib/liblapack.so
pip install numpy
pip install scipy
pip install scikit-learn
pip install pandas
pip install patsy
pip install statsmodels
pip install ipython tornado pyzmq
pip install networkx
pip install gensim
pip install scrapy
pip install numexpr bottleneck
pip install sqlalchemy
pip install nltk
pip install seaborn