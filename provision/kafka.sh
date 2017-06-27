#!/bin/bash

function join { local IFS="$1"; shift; echo "$*"; }

expand_zk_ip_range() {
  declare -a IP_RANGE=()

  for (( n=1 ; n<=$1 ; n++))
  do
    IP="10.10.10.$((10+${n})):2181"
    IP_RANGE+=($IP)
  done

  echo "${IP_RANGE[@]}"
}

SCALA_VERSION="2.12"
KAFKA_VERSION="0.10.2.1"

echo -e Running apt-get update/upgrade...
sudo apt-get update -y
sudo apt-get upgrade -y

echo -e Installing 'openjdk-8-jre-headless'...
sudo apt-get install openjdk-8-jre-headless -y

sudo mkdir -p /opt/kafka
cd /opt/kafka

echo -e Downloading Kafka...
sudo wget "http://www-eu.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz"
sudo tar -xvzf "kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" --strip 1

sudo chmod u+x /vagrant/sh/*.sh

echo -e Configuring Kafka...

sudo cp -f /opt/kafka/config/server.properties /opt/kafka/config/server.properties.backup

sudo sed -r -i "s/(broker.id)=(.*)/\1=$1/g" /opt/kafka/config/server.properties
sudo sed -r -i "s/#(advertised.listeners)=(.*)/\1=PLAINTEXT:\/\/10.10.10.$((20+$1)):9092/g" /opt/kafka/config/server.properties
sudo sed -r -i "s/(num.partitions)=(.*)/\1=$2/g" /opt/kafka/config/server.properties
sudo sed -r -i "s/(zookeeper.connect)=(.*)/\1=$(join , $(expand_zk_ip_range $2))/g" /opt/kafka/config/server.properties

echo -e Starting Kafka daemon...
sudo /opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties

echo -e Kafka daemon started!
