 #!/bin/bash
 
brew install sbt

cd /tmp
wget http://apache.spd.co.il/kafka/0.8.0/kafka_2.8.0-0.8.0.tar.gz 
tar -zxvf kafka_2.8.0-0.8.0.tar.gz -C /usr/local/
cd /usr/local/kafka_2.8.0-0.8.0

sbt update
sbt package

cd /usr/local
ln -s kafka_2.8.0-0.8.0 kafka

echo "" >> ~/.bash_profile
echo "" >> ~/.bash_profile
echo "# KAFKA" >> ~/.bash_profile
echo "export KAFKA_HOME=/usr/local/kafka" >> ~/.bash_profile
source ~/.bash_profile

echo "export KAFKA=$KAFKA_HOME/bin" >> ~/.bash_profile
echo "export KAFKA_CONFIG=$KAFKA_HOME/config" >> ~/.bash_profile
source ~/.bash_profile

$KAFKA/zookeeper-server-start.sh $KAFKA_CONFIG/zookeeper.properties
$KAFKA/kafka-server-start.sh $KAFKA_CONFIG/server.properties