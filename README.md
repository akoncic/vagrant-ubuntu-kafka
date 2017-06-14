About
=====
This repository contains a template [Vagrantfile][vagrantfile] for creating new [Kafka][kafka] cluster. As a result, you will have 64-bit [Ubuntu][ubuntu] 16.04 (Xenial Xerus) virtual machines running your own Kafka cluster.

This Kafka cluster does not come bundled with [ZooKeeper][zookeeper] and is meant to run alongside ZooKeeper cluster available in this [repository][vagrant-ubuntu-zk]. If you need more streamlined ZooKeeper/Kafka Vagrant setup, check out this [repository][vagrant-ubuntu-zk-kafka].

Getting Started
===============
- Install [VirtualBox][virtualbox] (> 5.1.22);
- install [Vagrant][vagrant] (> 1.9.5);
- clone this repository;
- execute `vagrant up`.

Default Setup
=============
By default, 3 Kafka brokers will be created. Broker details are as follow:

| Name | IP  | RAM (MB) | CPUs | CPU Cap (%) |
| :---: | :---: | :---: | :---: | :---: |
| kafka-01 | 10.10.10.21 | 1536 | 1 | 50 |
| kafka-02 | 10.10.10.22 | 1536 | 1 | 50 |
| kafka-03 | 10.10.10.23 | 1536 | 1 | 50 |

Kafka brokers expect ZooKeeper to be at `10.10.10.11`, `10.10.10.12` and/or `10.10.10.13`.

Custom Setup
============
In case you are not using ZooKeeper available [here][vagrant-ubuntu-zk], you will need to update ZooKeeper connection string for each created instance. See `zookeeper.connect` directive in `server.properties` configuration file for more information.

You can override default configuration with your own `config.rb` file. See `config.rb.sample` for more information.

Default configuration assumes maximum number of 3 instances. If you want to create more instances, you will need to manually create `server.properties` configuration file for each new instance.

Scripts
=======
Some Kafka scripts have been included for convenience. Details are as follow:

| Script | Description |
| --- | --- |
| `/vagrant/sh/kafka-topics-create.sh [TOPIC]` | Creates a 3-partitioned and 3-replicated topic. |
| `/vagrant/sh/kafka-topics-describe.sh [TOPIC]` | Gives a summary of a topic. |
| `/vagrant/sh/kafka-topics-list.sh` | Lists all topics. |
| `/vagrant/sh/kafka-topics-delete.sh [TOPIC]` | Deletes a topics. |
| `/vagrant/sh/kafka-tools-get-offset.sh [TOPIC]` | Gives an offset of a topic. |
| `/vagrant/sh/kafka-console-producer.sh [TOPIC]` | Produces messages for a topic. Use `Ctrl+C` to exit. |
| `/vagrant/sh/kafka-console-consumer.sh [TOPIC]` | Consumes messages on a topic. Use `Ctrl+C` to exit. |

[vagrantfile]: https://www.vagrantup.com/docs/vagrantfile/
[kafka]: https://kafka.apache.org/
[ubuntu]: https://atlas.hashicorp.com/ubuntu/boxes/xenial64
[zookeeper]: https://zookeeper.apache.org/
[vagrant-ubuntu-zk]: https://github.com/akoncic/vagrant-ubuntu-zk
[vagrant-ubuntu-zk-kafka]: https://github.com/akoncic/vagrant-ubuntu-zk-kafka
[virtualbox]: https://www.virtualbox.org/
[vagrant]: https://www.vagrantup.com/
