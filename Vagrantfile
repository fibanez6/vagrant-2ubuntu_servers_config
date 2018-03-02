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
        servervr.vm.network "private_network", ip: "172.16.0.10"
    end

    # Configure dbvr
    config.vm.define "dbvr" do |dbvr|
        dbvr.vm.provider "virtualbox" do |v|
            v.name   = "dbvr"
            v.memory = 1024
        end
        dbvr.vm.box = "ubuntu/trusty64"
        dbvr.vm.hostname = "dbvr"
        dbvr.vm.network "private_network", ip: "172.16.0.15"
        dbvr.vm.network "forwarded_port", guest: 27017, host: 27017
        dbvr.vm.provision "postgresql", type: "shell" do |s|
            s.path = "provision/scripts/databases/postgresql.sh"
        end
        dbvr.vm.provision "mongodb", type: "shell" do |s|
            s.path = "provision/scripts/databases/mongodb.sh"
        end
    end
end
