#!/usr/bin/env bash

#== Variables ==
#== Functionality ==

database_install() {
  echo "mysql-server mysql-server/root_password password root@secret" | debconf-set-selections
  echo "mysql-server mysql-server/root_password_again password root@secret" | debconf-set-selections

  apt-get -y install \
    mysql-server \
    postgresql postgresql-contrib \
    sqlite3 libsqlite3-dev
}

#== Provisioning Script ==

export DEBIAN_FRONTEND=noninteractive
database_install

service mysql restart
service postgresql restart
