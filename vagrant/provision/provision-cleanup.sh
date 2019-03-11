#!/usr/bin/env bash

#====================================================
#== Cleanup
#====================================================
apt-get -y autoremove
apt-get -y clean

#== fix ownership ==
chown -R root:root /root
chown -R vagrant:vagrant /home/vagrant
