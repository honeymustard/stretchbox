# Vagrant setup with debian/stretch64

This chronicles a vagrant development setup for Debian 9.

## Setup

* Install Vagrant and Virtualbox.
* Add a host name to **/etc/hosts** e.g. "192.168.33.10 stretchbox.dev".
* Add a host name to **provision/nginx.conf** e.g. "server_name stretchbox.dev".
* Run **rm -Rf .git/** in the root directory.
* Run **vagrant up** in root directory.

## Information

    ip    => 192.168.33.10
    ssh   => vagrant@stretch
    box   => debian/stretch64
    host  => stretchbox.dev

## Commands

    $ vagrant up [--provision]      # start machine  [with new settings]
    $ vagrant reload [--provision]  # reload machine [with new settings]
    $ vagrant ssh                   # command line access

## Issues

If vagrant complains about missing guest additions, try running these
commands before another provision.

    $ vagrant plugin install vagrant-vbguest
    $ vagrant vbguest

## Links

The Vagrant box can be found at [debian/boxes/stretch64](https://app.vagrantup.com/debian/boxes/stretch64).
The Vagrant docs are listed at [docs.vagrantup.com](https://docs.vagrantup.com).

