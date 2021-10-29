FROM centos:7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ADD azure-cli.repo /etc/yum.repos.d/


RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc; \
    yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget azure-cli jq rsync openssl sshpass; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    pip3 install netaddr; \
    python3 -m pip install ansible; \
    wget -q https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt; \
    pip3 install -r requirements-azure.txt; \
    rm requirements-azure.txt; \
    ansible-galaxy collection install azure.azcollection \



RUN mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts; \
    rm /usr/bin/python && ln --symbolic /usr/bin/python3 /usr/bin/python

CMD [ "ansible-playbook", "--version" ]
