# -*- mode: ruby -*-
# vi: set ft=ruby :

PROJECTS = {
    "web" => {
        :port => 8080,
        :source => "~/workplace1/buzzbike-webapp",
        :destination => "/home/vagrant/sync/buzzbike-webapp" },
    "api" => {
        :port => 5000,
        :source => "~/workplace1/buzzbike-api",
        :destination => "/home/vagrant/sync/buzzbike-api" }
}

SHELL_SCRIPTS = {
    "ssh-agent" => { :path => "provision/scripts/ssh.sh" },
    "utils" => { :path => "provision/scripts/utils.sh" },
    "git" => { :path => "provision/scripts/tools/git.sh" },
    "node-nvm" => { :path => "provision/scripts/platforms/node-nvm.sh" },
    "python3.5" => { :path => "provision/scripts/platforms/python3.5.sh" },
    "buzzbike-api" => { :path => "provision/scripts/projects/buzzbike_api_install.sh" }
}

FILE_COPY = {
    "credential-private" => {
        :source => "provision/credentials/id_rsa",
        :destination => "/home/vagrant/.ssh/id_rsa" },
    "credential-public" => {
        :source => "provision/credentials/id_rsa.pub",
        :destination => "/home/vagrant/.ssh/id_rsa.pub" }
}

DB_PORTS = {
    "postgresql" => { :guest => 5432, :host => 5432 },
    "mongodb" => { :guest => 27017, :host => 27017 }
}

DB_SCRIPTS = {
    "postgresql" => { :path => "provision/scripts/databases/postgresql.sh" },
    "buzzbike-db-setup" => { :path => "provision/scripts/projects/buzzbike_db.sh" },
    "mongodb" => { :path => "provision/scripts/databases/mongodb.sh" }
}


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
        servervr.ssh.forward_agent = true

        PROJECTS.each_with_index do |(name, info), index|
            servervr.vm.network "forwarded_port", guest: info[:port], host: info[:port]
            servervr.vm.synced_folder info[:source], info[:destination],
                owner: "vagrant",
                group: "vagrant",
                mount_options: ["dmode=775,fmode=664"]
        end

        FILE_COPY.each_with_index do |(name, info), index|
            servervr.vm.provision name, type: "file" do |f|
                f.source = info[:source]
                f.destination = info[:destination]
            end
        end

        SHELL_SCRIPTS.each_with_index do |(name, info), index|
            servervr.vm.provision name, type: "shell" do |s|
                s.path = info[:path]
            end
        end
    end

    # Configure dbvr
    config.vm.define "dbvr" do |dbvr|
        dbvr.vm.provider "virtualbox" do |v|
            v.name   = "dbvr"
            v.memory = 2048
        end
        dbvr.vm.box = "ubuntu/trusty64"
        dbvr.vm.hostname = "dbvr"
        dbvr.vm.network "private_network", ip: "172.16.0.15"

        DB_PORTS.each_with_index do |(name, info), index|
            dbvr.vm.network "forwarded_port", guest: info[:guest], host: info[:host]
        end

        DB_SCRIPTS.each_with_index do |(name, info), index|
            dbvr.vm.provision name, type: "shell" do |s|
                s.path = info[:path]
            end
        end
    end

end