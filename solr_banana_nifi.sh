 #!/bin/bash
 
## Solr setup
cd 
wget http://archive.apache.org/dist/lucene/solr/5.5.0/solr-5.5.0-src.tgz
tar xzf solr-5.1.0.tgz
cd solr-5.1.0
bin/solr start -e cloud -noprompt

## Access Solr using  http://localhost:8983/solr/#/~cloud in a browser

##Banana installation
## Clone Banana from GitHub and copy the src directory to Solr’s webapp directory
cd
git clone https://github.com/LucidWorks/banana.git
cp -R banana <PATH_TO_SOLR>/solr-5.1.0/server/solr-webapp/webapp/

#Browse to http://localhost:8983/solr/banana/src/index.html#/dashboard

##NiFi Setup
cd
git clone https://github.com/apache/incubator-nifi.git
cd incubator-nifi
git checkout develop
