#!/bin/bash

HO='\033[7m'
HC='\033[0m'

echo -e ${HO}Running apt-get update/upgrade...${HC}
sudo apt-get update -y
sudo apt-get upgrade -y

echo -e ${HO}Installing 'openjdk-8-jre-headless'...${HC}
sudo apt-get install openjdk-8-jre-headless -y

sudo mkdir -p /opt/kafka
cd /opt/kafka

echo -e ${HO}Downloading Kafka...${HC}
sudo wget "http://www-eu.apache.org/dist/kafka/0.10.2.1/kafka_2.12-0.10.2.1.tgz"
sudo tar -xvzf kafka_2.12-0.10.2.1.tgz --strip 1

sudo chmod u+x /vagrant/sh/*.sh

echo -e ${HO}Starting Kafka...${HC}
#sudo /opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties
sudo /opt/kafka/bin/kafka-server-start.sh -daemon /vagrant/config/server$1.properties

echo -e ${HO}Done!${HC}
