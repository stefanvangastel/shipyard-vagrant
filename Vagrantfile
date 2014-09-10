# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Require a recent version of vagrant otherwise some have reported errors setting host names on boxes
Vagrant.require_version ">= 1.6.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The number of minions to provision
  num_minion = 3

  # ip configuration
  master_ip = "10.245.1.2"
  minion_ip_base = "10.245.2."
  minion_ips = num_minion.times.collect { |n| minion_ip_base + "#{n+2}" }
  minion_ips_str = minion_ips.join(",")

  # Determine the OS platform to use
  docker_os = ENV['DOCKER_OS'] || "ubuntu"

  # OS platform to box information
  docker_box = {
    "ubuntu" => {
      "name" => "trusty64",
      "box_url" => "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    }
  }

  # Shipyard server
  config.vm.define "shipyard" do |shipyard|
    shipyard.vm.box = docker_box[docker_os]["name"]
    shipyard.vm.box_url = docker_box[docker_os]["box_url"]
    shipyard.vm.network "private_network", ip: "#{master_ip}"
    shipyard.vm.hostname = "shipyard"
    shipyard.vm.provision "shell", path: "provision_shipyard.sh"

  end

  # Docker hosts
  num_minion.times do |n|
    config.vm.define "docker-#{n+1}" do |minion|
      minion_index = n+1
      minion_ip = minion_ips[n]
      minion.vm.box = docker_box[docker_os]["name"]
      minion.vm.box_url = docker_box[docker_os]["box_url"]
      minion.vm.network "private_network", ip: "#{minion_ip}"
      minion.vm.hostname = "docker-#{minion_index}"
      minion.vm.provision "shell", path: "provision_hosts.sh"
    end

  end

end
