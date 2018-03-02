# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

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
        servervr.vm.synced_folder "~/workplace1/buzzbike-webapp", "/home/vagrant/buzzbike-webapp"

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
        servervr.vm.provision "git", type: "shell" do |s|
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