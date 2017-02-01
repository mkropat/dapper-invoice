# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024  # necessary to avoid 'I can't write on file' errors
  end

  config.vm.provision "shell", inline: \
    'apt-get install -y texlive texlive-fonts-extra texlive-latex-extra texlive-science texlive-xetex lmodern'
end
