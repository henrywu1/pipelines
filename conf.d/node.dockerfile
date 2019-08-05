FROM debian:latest
RUN bin/bash -c 'apt-get update'
RUN bin/bash -c 'apt-get install -y python-pip nano ssh zip tar'
RUN bin/bash -c 'apt-get clean'
RUN bin/bash -c 'sed -i "20i\ForwardAgent yes" /etc/ssh/ssh_config'
RUN bin/bash -c 'sed -i "35i\StrictHostKeyChecking no" /etc/ssh/ssh_config'
RUN bin/bash -c 'pip install ansible==2.8.3'
RUN bin/bash -c 'pip install boto==2.49.0'
RUN bin/bash -c 'pip install awscli==1.16.210'
ADD 'https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip' .
RUN bin/bash -c 'unzip terraform*'
RUN bin/bash -c 'mv terraform /usr/local/bin/'
RUN bin/bash -c 'rm terraform*'
