#!/usr/bin/env bash

#== Variables ==
#== Functionality ==

extras_nodejs_install() {
  if [ ! -f "/usr/bin/node" ]; then
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    apt-get install -y nodejs
  fi
}

extras_javasdk_install() {
  apt-get -y install \
    openjdk-8-jdk \
    openjdk-8-source

  if [ ! -d "/home/vagrant/.sdkman" ]; then
    su - vagrant -c 'curl -s "https://get.sdkman.io" | bash'
    su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install groovy'
    su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install gradle'
    su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh && yes | sdk install maven'
  fi
}

extras_composer_install() {
  if [ ! -f "/usr/local/bin/composer" ]; then
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
  fi
}

extras_wpcli_install() {
  if [ ! -f "/usr/local/bin/wp" ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
  fi
}

extras_mailhog_install() {
  if [ ! -f "/usr/local/bin/mailhog" ]; then
    wget --quiet -O /usr/local/bin/mailhog \
      https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64

    chmod +x /usr/local/bin/mailhog
  fi
}

extras_mhsendmail_install() {
  if [ ! -f "/usr/local/bin/mhsendmail" ]; then
    wget --quiet -O /usr/local/bin/mhsendmail \
      https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64

    chmod +x /usr/local/bin/mhsendmail
  fi
}

extras_ohmyzsh_install() {
  if [ ! -d "/home/vagrant/.oh-my-zsh" ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
    cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
    chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh
    chown vagrant:vagrant /home/vagrant/.zshrc
  fi
}

#== Provisioning Script ==

export DEBIAN_FRONTEND=noninteractive
extras_nodejs_install
extras_javasdk_install
extras_composer_install
extras_wpcli_install
extras_mailhog_install
extras_mhsendmail_install
extras_ohmyzsh_install
