#
# Base Dockerfile
#
#
FROM hpierce/docker-ubuntu-16.04-base

MAINTAINER Hugh Pierce

ENV DEBIAN_FRONTEND noninteractive

# install ansible
RUN apt-add-repository ppa:ansible/ansible -y && apt-get update && apt-get install ansible -y 

# install rundeck user and keys
RUN useradd -m -d /home/rundeck -s /bin/bash rundeck
ADD .ssh /home/rundeck/.ssh
RUN chown -R rundeck:rundeck /home/rundeck/.ssh

