# -*- mode: ruby -*-
# vi: set ft=ruby :

PROJECT_NAME = "buzzbike-webapp"
PROJECT_SOURCE_DIR = "~/workplace1/"+PROJECT_NAME
PROJECT_DESTINATION_DIR = "/home/vagrant/sync/"+PROJECT_NAME

Vagrant.configure("2") do |config|

    # Configure servervr
    config.vm.define "servervr" do |servervr|
        servervr.vm.provider "virtualbox" do |v|
            v.name = "servervr"
            v.memory = 2048
        end
        servervr.vm.box = "ubuntu/trusty64"
        servervr.vm.hostname = "servervr"

        servervr.vm.network "private_network", ip: "172.16.0.10"
        servervr.vm.network "forwarded_port", guest: 8080, host: 8080
        servervr.ssh.forward_agent = true
        servervr.vm.synced_folder PROJECT_SOURCE_DIR, PROJECT_DESTINATION_DIR,
            owner: "vagrant",
            group: "vagrant",
            mount_options: ["dmode=775,fmode=664"]

        servervr.vm.provision "credential-private", type: "file" do |f|
            f.source = "provision/credentials/id_rsa"
            f.destination = "/home/vagrant/.ssh/id_rsa"
        end
        servervr.vm.provision "credential-public", type: "file" do |f|
            f.source = "provision/credentials/id_rsa.pub"
            f.destination = "/home/vagrant/.ssh/id_rsa.pub"
        end
        servervr.vm.provision "ssh-agent", type: "shell" do |s|
            s.path = "provision/scripts/ssh.sh"
        end
        servervr.vm.provision "utils", type: "shell" do |s|
            s.path = "provision/scripts/utils.sh"
        end
        servervr.vm.provision "git", type: "shell" do |s|
            s.path = "provision/scripts/tools/git.sh"
        end
        servervr.vm.provision "node", type: "shell" do |s|
            s.path = "provision/scripts/platforms/node-nvm.sh"
        end
    end

end