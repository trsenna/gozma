#!/usr/bin/env bash

#====================================================
#== Common
#====================================================
apt-get -y update
apt-get -y install \
  colordiff dos2unix gettext graphviz imagemagick \
  git-core subversion ngrep wget unzip zip \
  whois vim mcrypt bash-completion zsh \
  htop curl vim iotop





#====================================================
#== MySQL
#====================================================
echo "mysql-server mysql-server/root_password password root@secret" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root@secret" | debconf-set-selections
apt-get -y install mysql-server





#====================================================
#== PostgreSQL
#====================================================
apt-get -y install \
  postgresql \
  postgresql-contrib





#====================================================
#== SQLite
#====================================================
apt-get -y install \
  sqlite3 \
  libsqlite3-dev





#====================================================
#== Node.js
#====================================================
if [ ! -f "/usr/bin/node" ]; then
  curl -sL https://deb.nodesource.com/setup_8.x | bash -
  apt-get install -y nodejs
fi





#====================================================
#== MailHog
#====================================================
if [ ! -f "/usr/local/bin/mailhog" ]; then
  wget --quiet -O /usr/local/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64
  chmod +x /usr/local/bin/mailhog
fi





#====================================================
#== mhsendmail
#====================================================
if [ ! -f "/usr/local/bin/mhsendmail" ]; then
  wget --quiet -O /usr/local/bin/mhsendmail https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64
  chmod +x /usr/local/bin/mhsendmail
fi
