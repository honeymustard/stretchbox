# Stretchbox

A simple LEMP stack for Vagrant with Debian 9.

## Setup

* Install **Vagrant** and **Virtualbox**.
* Add a host name to **/etc/hosts** e.g. "192.168.33.10 stretchbox.dev".
* Add a host name to **provision/nginx.conf** e.g. "server_name stretchbox.dev".
* Run **rm -Rf .git/** in the root directory.
* Run **vagrant up** in the root directory.

## Information
```
System
host  => stretchbox.dev
ip    => 192.168.33.10:80
user  => vagrant@stretch

MariaDB
host  => localhost
user  => root
pass  => root
```

## Commands
```
$ vagrant up     [--provision]  # start machine  [with new settings]
$ vagrant reload [--provision]  # reload machine [with new settings]
$ vagrant ssh                   # command line access
```

## Issues

If vagrant complains about missing guest additions, try running these
commands before attempting another provision.
```
$ vagrant plugin install vagrant-vbguest
$ vagrant vbguest
```

## Resources

Default Debian box [debian/boxes/stretch64](https://app.vagrantup.com/debian/boxes/stretch64)<br>
The official Vagrant documentation [docs.vagrantup.com](https://docs.vagrantup.com)

## Copyright
Licensed under the MIT license (MIT).<br>
Copyright &copy; 2017 Adrian Solumsmo.
