# VAGRANT + VIRTUAL BOX

Installation of 2 ubuntu servers and one of them with postgres database

- Through a "Shell" provision

### REQUIREMENTS
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/) 


### INSTALLATION

```
> git clone https://github.com/fibanez6/vagrant-2ubuntu_servers_config
> cd vagrant-2ubuntu_servers_config
> vagrant up
```

## GITHUB SSH-KEY
You need to (generate a new SSH key)[https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent] and store them on (provision/credentials/)
* id_rsa
* id_rsa.pub

then add the following code in the Vagrantfile
```
config.vm.provision "credential-private", type: "file" do |f|
    f.source = "provision/credentials/id_rsa"
    f.destination = "/home/vagrant/.ssh/id_rsa"
end
config.vm.provision "credential-public", type: "file" do |f|
    f.source = "provision/credentials/id_rsa.pub"
    f.destination = "/home/vagrant/.ssh/id_rsa.pub"
end
config.vm.provision "ssh-agent", type: "shell" do |s|
    s.path = "provision/scripts/ssh.sh"
end
```

### SHUTDOWN
```
> vagrant halt
```