#!/bin/bash

if [ $# -gt 0 ]; then
  /opt/kafka/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list 10.10.10.21:9092,10.10.10.22:9092,10.10.10.23:9092 --topic $1 --time -1
else
  echo "Usage: "$(basename $0)" [TOPIC]"
fi
