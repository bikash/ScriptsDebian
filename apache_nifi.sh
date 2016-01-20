 #!/bin/bash

sudo apt-get -y update
sudo apt-get install -y wget openjdk-7-jdk git

sudo apt-get remove maven*
wget http://apache.arvixe.com/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
tar -zxf apache-maven-3.2.5-bin.tar.gz
sudo cp -R apache-maven-3.2.5 /usr/local
sudo ln -s /usr/local/apache-maven-3.2.5/bin/mvn /usr/bin/mvn
rm apache-maven-3.2.5-bin.tar.gz

mkdir matched
mkdir unmatched
git clone https://github.com/apache/nifi.git
cd nifi
git checkout nifi-0.0.2-incubating-RC1
cd nifi-nar-maven-plugin/
mvn clean install
cd ../nifi && mvn -T C2.0 clean install -DskipTests
cp nifi-assembly/target/nifi-*.tar.gz ~/
cd ~/ && tar -xzf nifi-*.tar.gz
cd nifi-*-incubating

echo 'Starting Apache nifi .....'
bin/nifi.sh start