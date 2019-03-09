#!/usr/bin/env bash

#== Variables ==
#== Functionality ==

common_update() {
  apt-get -y update
}

common_install() {
  apt-get -y install \
    colordiff dos2unix gettext graphviz imagemagick \
    git-core subversion ngrep wget unzip zip \
    whois vim mcrypt bash-completion zsh \
    htop curl vim iotop
}

#== Provisioning Script ==

export DEBIAN_FRONTEND=noninteractive
common_update
common_install
