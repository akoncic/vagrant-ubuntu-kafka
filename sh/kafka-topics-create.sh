#!/bin/bash

if [ $# -gt 0 ]; then
  /opt/kafka/bin/kafka-topics.sh --create --zookeeper 10.10.10.11:2181,10.10.10.12:2181,10.10.10.13:2181 --replication-factor 3 --partition 3 --topic $1
else
  echo "Usage: "$(basename $0)" [TOPIC]"
fi
