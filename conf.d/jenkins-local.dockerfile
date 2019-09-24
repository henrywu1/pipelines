FROM jenkins/jenkins
USER root
RUN bin/bash -c 'apt-get update'
RUN bin/bash -c 'apt-get install -y python-pip nano zip tar mysql-client'
RUN bin/bash -c 'apt-get clean'
RUN bin/bash -c 'sed -i "20i\ForwardAgent yes" /etc/ssh/ssh_config'
RUN bin/bash -c 'sed -i "35i\StrictHostKeyChecking no" /etc/ssh/ssh_config'
RUN bin/bash -c 'pip install ansible==2.4.1'
RUN bin/bash -c 'pip install boto==2.49.0'
RUN bin/bash -c 'pip install awscli==1.16.210'
RUN bin/bash -c 'pip install cryptography==2.7'
ADD 'https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip' .
ADD 'https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip' .
RUN bin/bash -c 'unzip terraform*'
RUN bin/bash -c 'unzip *packer*'
RUN bin/bash -c 'mv terraform /usr/local/bin/'
RUN bin/bash -c 'mv packer /usr/local/bin/'
RUN bin/bash -c 'rm terraform*'
RUN bin/bash -c 'rm *packer*'
RUN bin/bash -c 'mkdir /home/jenkins/'
RUN bin/bash -c 'mkdir /home/jenkins/.envars'
COPY './aws' '/home/jenkins/.envars/'
COPY './ansible_vault_key' '/home/jenkins/.envars/'
RUN bin/bash -c 'chown -R jenkins:jenkins /home/jenkins'
USER jenkins
