FROM jenkins/jenkins:latest
USER root
RUN bin/bash -c 'apt-get update'
RUN bin/bash -c 'apt-get install -y nano'
RUN bin/bash -c 'apt-get clean'
RUN bin/bash -c 'sed -i "20i\ForwardAgent yes" /etc/ssh/ssh_config'
RUN bin/bash -c 'sed -i "35i\StrictHostKeyChecking no" /etc/ssh/ssh_config'
USER jenkins
