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

  config.vm.provision "shell", path: "provision/bootstrap.sh"
end
