#
# Base Dockerfile
#
#
FROM hpierce/docker-ubuntu-16.04-base

MAINTAINER Hugh Pierce

ENV DEBIAN_FRONTEND noninteractive

# required packages for ansible
RUN apt-get install -y python python-pip python-openssl

# install ansible
RUN pip install --upgrade pip && pip install ansible

# install rundeck user and keys
RUN useradd -m -d /home/rundeck -s /bin/bash rundeck
ADD .ssh /home/rundeck/.ssh
RUN chown -R rundeck:rundeck /home/rundeck/.ssh

