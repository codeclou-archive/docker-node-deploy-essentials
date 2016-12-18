FROM ubuntu:16.04

#
# PACKAGES
#
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
    apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/* && \
    sudo apt-get update && \
    sudo apt-get -y install nodejs wget bzip2 build-essential zlib1g-dev

#
# NODE DEPLOY ESSENTIALS INSTALL
#
RUN npm install -g node-deploy-essentials

#
# WORKDIR
#
RUN mkdir /opt/npm/ && chmod 777 /opt/npm/
WORKDIR /opt/npm/

#
# RUN AS NON ADMIN
#
RUN useradd --system --uid 72379 -m --shell /usr/sbin/nologin nonadmin
USER nonadmin


CMD ndes --version
