# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :node1 do |node|
    node.vm.box = "ubuntu/precise64"
    node.vm.network :private_network, ip: "10.200.19.21"
  end

  config.vm.define :node2 do |node|
    node.vm.box = "ubuntu/precise64"
    node.vm.network :private_network, ip: "10.200.19.22"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"

    ansible.groups = {
      "master" => ["node1"],
      "slave"  => ["node2"],
    }

    ansible.extra_vars = "develop/group_vars/all"
  end
end
