#!/usr/bin/env bash

# Setup logs
if [ ! -d /vagrant/log ]; then
    mkdir /vagrant/log
fi

if [ ! -d /vagrant/log/nginx ]; then
    mkdir /vagrant/log/nginx
fi

# Add public key
sudo cat ~vagrant/.ssh/id_rsa.pub >> ~vagrant/.ssh/authorized_keys

# Install packages
sudo apt-get update

# Essentials
sudo apt-get install --yes vim
sudo apt-get install --yes zsh
sudo apt-get install --yes git
sudo apt-get install --yes silversearcher-ag

# LEMP core
sudo apt-get install --yes nginx
sudo apt-get install --yes mariadb-server
sudo apt-get install --yes php-fpm

# PHP libraries
sudo apt-get install --yes php-mysql
sudo apt-get install --yes php-curl
sudo apt-get install --yes php-gd
sudo apt-get install --yes php-mbstring
sudo apt-get install --yes php-mcrypt
sudo apt-get install --yes php-xml
sudo apt-get install --yes php-xmlrpc

# Misc libraries
sudo apt-get install --yes curl

# Node JS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install --yes nodejs

# Configure Nginx
sudo cp /vagrant/provision/nginx/nginx.conf /etc/nginx/nginx.conf
sudo chmod 644 /etc/nginx/nginx.conf
sudo cp /vagrant/provision/nginx/site.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -sf /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
sudo systemctl restart nginx

# Configure MariaDB
sudo mariadb --user=root --password=root --execute="\
DROP USER IF EXISTS 'root'@'localhost';\
CREATE USER IF NOT EXISTS 'root'@'%' identified by 'root';\
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';\
FLUSH PRIVILEGES;" > /dev/null 2>&1

# Configure PHP
sudo cp /vagrant/provision/php.ini /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm

# Finish
sudo rm -Rf /var/www
ln -s /vagrant /var/www
