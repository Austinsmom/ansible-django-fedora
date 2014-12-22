# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "xcezx/centos6.5-with-ansible"
  config.vm.box_url = "https://atlas.hashicorp.com/xcezx/boxes/centos6.5-with-ansible"

  config.vm.network :private_network, ip: "192.168.33.32"

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     vb.name = "StoryDecoderDjangoApp"
 
     # Customize the amount of memory on the VM:
     vb.memory = "1024"
  end

  # config.vm.provider :virtualbox do |vb|
  #   vb.customize ["modifyvm", :id, "--name", "StoryDecoderDjangoApp", "--memory", "1024"]
  # end

  # Shared folder from the host machine to the guest machine. Uncomment the line
  # below to enable it.
  #config.vm.synced_folder "../../../my-cool-app", "/webapps/mycoolapp/my-cool-app"

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "vagrant.yml"
    ansible.host_key_checking = false
    ansible.verbose = "v"
  end
end
