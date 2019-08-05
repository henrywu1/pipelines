FROM debian:latest
RUN bin/bash -c 'apt-get update && \
    apt-get install -y python-pip nano && \
    pip install ansible==2.8.3 && \
    pip install boto==2.49.0 && \
    pip install awscli==1.16.210 && \
    wget https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip && \
    unzip terraform* && \
    mv terraform /usr/local/bin/ && \
    rm terraform* && \
    apt-get clean && \
    sed -i "20i\ForwardAgent yes" /etc/ssh/ssh_config && \
    sed -i "35i\StrictHostKeyChecking no" /etc/ssh/ssh_config'
