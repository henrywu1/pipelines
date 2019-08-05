FROM jenkins/jenkins
USER root
RUN bin/bash -c 'apt-get update && \
    apt-get install -y nano && \
    apt-get clean && \
    sed -i "20i\ForwardAgent yes" /etc/ssh/ssh_config && \
    sed -i "35i\StrictHostKeyChecking no" /etc/ssh/ssh_config'
USER jenkins
