#!/usr/bin/env bash

#== Variables ==
#== Functionality ==

cleanup_clean() {
  apt-get -y autoremove
  apt-get -y clean
}

cleanup_ownership() {
  chown -R vagrant:vagrant /home/vagrant
}

#== Provisioning Script ==

export DEBIAN_FRONTEND=noninteractive

cleanup_clean
cleanup_ownership
