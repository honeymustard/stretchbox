# -*- mode: ruby -*-

# Development setup for debian/stretch.
Vagrant.configure("2") do |config|

  # Debian stretch
  config.vm.box = "debian/stretch64"
  config.vm.box_url = "https://app.vagrantup.com/debian/boxes/stretch64"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Copy certain config files
  config.vm.provision "file", source: "~/.agignore", destination: "~/.agignore"
  config.vm.provision "file", source: "~/.gitconfig", destination: "~/.gitconfig"
  config.vm.provision "file", source: "~/.vimrc", destination: "~/.vimrc"

  # Up this if you need more space
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "256"
  end

  config.vm.provision "shell", inline: <<-SHELL

    # install packages
    apt-get update
    apt-get install --yes silversearcher-ag
    apt-get install --yes nginx

    # copy files
    sudo cp /vagrant/provision/nginx.conf /etc/nginx/sites-available/site.conf
    sudo chmod 644 /etc/nginx/sites-available/site.conf
    sudo ln -sf /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
    sudo service nginx restart

    sudo rm -Rf /var/www
    ln -s /vagrant /var/www
  SHELL
end
