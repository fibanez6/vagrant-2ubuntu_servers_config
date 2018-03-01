# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Configure servervr
    config.vm.define "servervr" do |servervr|
        servervr.vm.provider "virtualbox" do |v|
            v.name = "servervr"
            v.memory = 1024
        end
        servervr.vm.box = "ubuntu/trusty64"
        servervr.vm.hostname = "servervr"
        servervr.vm.network "private_network", ip: "10.0.0.10"
    end

    # Configure psqlvr
    config.vm.define "psqlvr" do |psqlvr|
        psqlvr.vm.provider "virtualbox" do |v|
            v.name   = "psqlvr"
            v.memory = 1024
        end
        psqlvr.vm.box = "ubuntu/trusty64"
        psqlvr.vm.hostname = "psqlvr"
        psqlvr.vm.network "private_network", ip: "10.0.0.15"
        psqlvr.vm.provision "shell" do |s|
            s.path = "provision/scripts/postgres.sh"
        end
    end
end
