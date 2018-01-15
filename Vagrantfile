# -*- mode: ruby -*-

Vagrant.configure("2") do |config|

  # Default box
  config.vm.box = "debian/contrib-stretch64"
  config.vm.box_url = "https://app.vagrantup.com/debian/boxes/contrib-stretch64"

  config.vm.network "forwarded_port", guest: 22, host: 6464, id: "ssh"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Copy certain files
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "~/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.agignore", destination: "~/.agignore"
  config.vm.provision "file", source: "~/.gitconfig", destination: "~/.gitconfig"
  config.vm.provision "file", source: "~/.vimrc", destination: "~/.vimrc"
  config.vm.provision "file", source: "~/.zshrc", destination: "~/.zshrc"

  # Up this if you need more space
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Stretchbox"
    vb.memory = "256"
  end

  # Run provision script
  config.vm.provision "shell", path: "provision/bootstrap.sh"

  # Restart services
  config.vm.provision "shell", inline: "sudo service mariadb restart", run: "always"
  config.vm.provision "shell", inline: "sudo service nginx restart", run: "always"
end
