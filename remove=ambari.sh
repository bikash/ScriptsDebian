 #!/bin/bash
echo "==> Stop Ambari and Hue"

 ambari-server stop && ambari-agent stop   

echo "Stopping Hue"
 /etc/init.d/hue stop

echo "Waiting while Hue is stopping"
sleep 10


echo "==> Erase HDP and Ambari completely"
apt-get remove ambari-agent ambari-server ambari-log4j hadoop libconfuse nagios ganglia sqoop hcatalog\* hive\* hbase\* zookeeper\* oozie\* pig\* snappy\* hadoop-lzo\* knox\* hadoop\* storm\* hue\*
# remove configs
rm -rf /var/lib/ambari-*/keys /etc/hadoop/ /etc/hive /etc/hbase/ /etc/oozie/ /etc/zookeeper/ /etc/falcon/ /etc/ambari-* /etc/hue/
# remove ambaris default hdfs dir
rm -rf /hadoop
# remove the repos
echo "==> Remove HDP and Ambari Repo"
rm -rf /etc/apt/sources.list.d/HDP.repo /etc/apt/sources.list.d/ambari.repo
# delete all HDP related users
echo "==> Delete the user accounts"
userdel -f hdfs && userdel -f sqoop && userdel -f hue && userdel -f yarn && userdel -f hbase && userdel -f && hive userdel -f oozie && userdel -f hcat && userdel -f puppet && userdel -f storm && userdel -f ambari-qa && userdel -f ambari_qa && userdel -f tez && userdel -f flume && userdel -f hadoop_deploy && userdel -f hcatalog && userdel -f zookeeper && userdel -f falcon && userdel -f rrdcached
# remove the unwanted sockets
echo "==> remove the HDFS socket and logs"
rm -rf /var/run/hdfs-sockets
rm -rf /var/log/sqoop2 /var/log/hdfs* /var/log/hadoop-* /var/log/hbase* /var/log/hue* /var/log/nagios /var/log/oozie /var/log/storm /var/log/zookeeper /var/log/falcon /var/log/flume* /var/run/flume-ng/ /var/run/hadoop* /var/run/hbase/ /var/run/hue/ /var/run/nagios/ /var/run/oozie/ /var/run/solr/ /var/run/spark/ /var/run/sqoop2/ /var/run/storm/ /var/run/zookeeper/ /var/lib/oozie/

apt-get remove ambari-*  

groupdel yarn mapred hbase hive zookeeper spark

 rm -rf /var/lib/ambari-*  
 rm -rf /var/lib/hadoop* 
 rm -rf /var/run/ambari* 

rm -rf /etc/hadoop
rm -rf /etc/zookeepers
rm -rf /var/run/zookeeper	
rm -rf /var/run/hadoop-hdfs	
rm -rf /var/run/hadoop-yarn	
rm -rf /var/run/hadoop-mapreduce
rm -rf /var/log/zookeeper
rm -rf /var/log/hadoop-hdfs
rm -rf /var/log/hadoop-yarn
rm -rf /var/log/hadoop-mapreduce
rm -rf /usr/lib/flume
rm -rf /usr/lib/storm
rm -rf /var/lib/hadoop-hdfs
rm -rf /var/lib/hadoop-yarn
rm -rf /var/lib/hadoop-mapreduce
rm -rf /hadoop/zookeeper


sudo apt-get -q -y -f build-dep virtualbox-ose-guest-utils virtualbox-guest-x11 virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms


