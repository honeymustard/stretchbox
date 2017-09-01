#!/usr/bin/env bash

# setup logs
if [ ! -d /vagrant/log ]; then
    mkdir /vagrant/log
fi

if [ ! -d /vagrant/log/nginx ]; then
    mkdir /vagrant/log/nginx
fi

# install packages
sudo apt-get update

# Essentials
sudo apt-get install --yes vim
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

# Node js
sudo apt-get install --yes curl
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install --yes nodejs

# configure nginx
sudo cp /vagrant/provision/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -sf /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
sudo systemctl restart nginx

# configure mariadb
sudo mariadb --user=root --password=root --execute="\
DROP USER IF EXISTS 'root'@'localhost';\
CREATE USER IF NOT EXISTS 'root'@'%' identified by 'root';\
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';\
FLUSH PRIVILEGES;" > /dev/null 2>&1

# configure php
sudo cp /vagrant/provision/php.ini /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm

# finish
sudo rm -Rf /var/www
ln -s /vagrant /var/www
