#!/usr/bin/env bash

# Installation on brand new Centos machine.
# Based on post found on https://www.vultr.com/docs/how-to-install-hadoop-in-stand-alone-mode-on-centos-7

VERSION=3.0.1
INSTALL_DIR="/opt"
HADOOP_HOME="${INSTALL_DIR}/hadoop-${VERSION}"
VAGRANT_HOME="/home/vagrant"

yum install epel-release -y 
yum update -y
#shutdown -r now

# As of Apr 2018, none of Hadoop versions worth with Java 9.
yum install -y vim wget java-1.8.0-openjdk java-1.8.0-openjdk-devel

# Add items to install for Hdaoop 
cd /vagrant
wget --quiet http://www-us.apache.org/dist/hadoop/common/hadoop-${VERSION}/hadoop-${VERSION}.tar.gz
wget --quiet http://www-us.apache.org/dist/hadoop/common/hadoop-${VERSION}/hadoop-${VERSION}.tar.gz.mds

tar -zxvf hadoop-${VERSION}.tar.gz -C $INSTALL_DIR

echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")' \
| tee -a ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh

ln -s ./hadoop-${VERSION} ${INSTALL_DIR}/hadoop
echo "export PATH=/opt/hadoop/bin:$PATH" | tee -a /etc/profile

# Basic hadoop configs are copied from git source to local instance.
cp /vagrant/*.xml ${HADOOP_HOME}/etc/hadoop

# Set up a ssh key for itself 
if [ ! -f "${VAGRANT_HOME}/.ssh/id-rsa" ]; then
  ssh-keygen -t rsa -N "" -f ${VAGRANT_HOME}/.ssh/id_rsa
  cat ${VAGRANT_HOME}/.ssh/id_rsa.pub >> ${VAGRANT_HOME}/.ssh/authorized_keys
  cat << 'SSHEOF' > ${VAGRANT_HOME}/.ssh/config
HOST *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF
fi


chown -R vagrant:vagrant ${VAGRANT_HOME}/.ssh

# Add portion to create $HADOOP_HOME/logs and be writable by vagrant user
mkdir ${HADOOP_HOME}/logs && chown root:vagrant ${HADOOP_HOME}/logs && chmod g+w ${HADOOP_HOME}/logs


