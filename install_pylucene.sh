#!/bin/bash
#
source $VIRTUAL_ENV/bin/activate

mkdir tmp-lucene
pushd tmp-lucene

ROOT=$(dirname $0)

wget http://www.apache.org/dist/lucene/pylucene/pylucene-3.0.2-1-src.tar.gz
tar -xzf pylucene-3.0.2-1-src.tar.gz

pushd pylucene-3.0.2-1
cp ../../$ROOT/Makefile . 
make
make install
popd

popd
rm -rf tmp-lucene