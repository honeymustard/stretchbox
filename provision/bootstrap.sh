#!/usr/bin/env bash

# install packages
apt-get update
apt-get install --yes silversearcher-ag
apt-get install --yes nginx
apt-get install --yes mysql-server
apt-get install --yes php-fpm php-mysql

# configure nginx
sudo cp /vagrant/provision/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -sf /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
sudo service nginx restart

# configure mysql
sudo mysql --user=root --password=root --execute="\
DROP USER IF EXISTS 'root'@'localhost';\
CREATE USER IF NOT EXISTS 'root'@'%' identified by 'root';\
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';\
FLUSH PRIVILEGES;"

# configure php
systemctl restart php7.0-fpm 

# finish
sudo rm -Rf /var/www
ln -s /vagrant /var/www
