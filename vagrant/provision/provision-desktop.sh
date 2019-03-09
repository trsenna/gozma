#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get -y install \
  xubuntu-core^ \
  virtualbox-guest-dkms \
  virtualbox-guest-utils \
  virtualbox-guest-x11 \
  chromium-browser

sudo VBoxClient --checkhostversion
sudo VBoxClient --clipboard
sudo VBoxClient --display
sudo VBoxClient --draganddrop
sudo VBoxClient --seamless
