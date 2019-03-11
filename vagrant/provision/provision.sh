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
#== Java SDK
#====================================================
apt-get -y install \
  openjdk-8-jdk \
  openjdk-8-source





#====================================================
#== SDKMAN & SDKs
#====================================================
if [ ! -d "/home/vagrant/.sdkman" ]; then
  su - vagrant -c 'curl -s "https://get.sdkman.io" | bash'
  su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install groovy'
  su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install gradle'
  su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install maven'
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





#====================================================
#== Oh My ZSH!
#====================================================
if [ ! -d "/home/vagrant/.oh-my-zsh" ]; then
  su - vagrant -c 'git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh'
  su - vagrant -c 'cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc'
fi
