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
#== WebServer
#====================================================
apt-get -y install \
  apache2 php7.2 \
  libapache2-mod-php7.2 \
  php7.2-cli php7.2-common php7.2-dev \
  php7.2-pgsql php7.2-sqlite3 php7.2-gd \
  php7.2-curl php7.2-memcached \
  php7.2-imap php7.2-mysql php7.2-mbstring \
  php7.2-xml php7.2-zip php7.2-bcmath php7.2-soap \
  php7.2-intl php7.2-readline php7.2-opcache \
  php7.2-xmlrpc php7.2-xsl php7.2-json \
  php7.2-bz2 php7.2-imagick \
  php-pear

cat /vagrant/files/000-default.conf > /etc/apache2/sites-available/000-default.conf

sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.2/apache2/php.ini
sed -i "s/post_max_size = .*/post_max_size = 64M/" /etc/php/7.2/apache2/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 32M/" /etc/php/7.2/apache2/php.ini

a2enmod expires
a2enmod headers
a2enmod include
a2enmod rewrite

#== run with different user ==
sed -ri 's/^(export APACHE_RUN_USER=)(.*)$/\1vagrant/' /etc/apache2/envvars
sed -ri 's/^(export APACHE_RUN_GROUP=)(.*)$/\1vagrant/' /etc/apache2/envvars

chown -R vagrant:vagrant /var/lock/apache2
chown -R vagrant:vagrant /var/log/apache2
chown -R vagrant:vagrant /var/www

#== service restart ==
service apache2 restart





#====================================================
#== Database
#====================================================
echo "mysql-server mysql-server/root_password password root@secret" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root@secret" | debconf-set-selections

apt-get -y install \
  mysql-server \
  postgresql postgresql-contrib \
  sqlite3 libsqlite3-dev

#== service restart ==
service mysql restart
service postgresql restart





#====================================================
#== Extras
#====================================================

#== Node.js ==
if [ ! -f "/usr/bin/node" ]; then
  curl -sL https://deb.nodesource.com/setup_8.x | bash -
  apt-get install -y nodejs
fi

#== Java SDK ==
apt-get -y install \
  openjdk-8-jdk \
  openjdk-8-source

#== SDKMAN & SDKs ==
if [ ! -d "/home/vagrant/.sdkman" ]; then
  su - vagrant -c 'curl -s "https://get.sdkman.io" | bash'
  su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install groovy'
  su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install gradle'
  su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install maven'
fi

#== Composer ==
if [ ! -f "/usr/local/bin/composer" ]; then
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
fi

#== WP-CLI ==
if [ ! -f "/usr/local/bin/wp" ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -f "/usr/local/bin/mailhog" ]; then
  wget --quiet -O /usr/local/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64
  chmod +x /usr/local/bin/mailhog
fi

if [ ! -f "/usr/local/bin/mhsendmail" ]; then
  wget --quiet -O /usr/local/bin/mhsendmail https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64
  chmod +x /usr/local/bin/mhsendmail
fi

if [ ! -d "/home/vagrant/.oh-my-zsh" ]; then
  su - vagrant -c 'git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh'
  su - vagrant -c 'cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc'
fi

#====================================================
#== Cleanup
#====================================================
apt-get -y autoremove
apt-get -y clean

#== fix ownership ==
chown -R root:root /root
chown -R vagrant:vagrant /home/vagrant
