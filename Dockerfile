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

# install ansible user and keys
RUN useradd -m -d /home/ansible -s /bin/bash ansible
ADD .ssh /home/ansible/.ssh
RUN chown -R ansible:ansible /home/ansible/.ssh

