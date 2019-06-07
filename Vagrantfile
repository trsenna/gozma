Vagrant.configure("2") do |config|
  # Ubuntu 18.04 - Bionic Beaver
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "bento/ubuntu-18.04"
    ubuntu.vm.hostname = "gozma"
    ubuntu.vm.network "private_network", ip: "192.168.27.10"
    # provisioners
    ubuntu.vm.provision 'shell', path: 'vagrant/provision/provision.sh'
    ubuntu.vm.provision 'shell', path: 'vagrant/provision/provision-webserver.sh'
    ubuntu.vm.provision 'shell', path: 'vagrant/provision/provision-cleanup.sh'
    # synced folders
    ubuntu.vm.synced_folder '.', '/vagrant', disabled: true
    ubuntu.vm.synced_folder 'projects', '/projects', owner: 'vagrant', group: 'vagrant', create: true
    # configuration
    ubuntu.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
end
