### Pre-requirements:
* Vagrant >= 1.6.3 (http://www.vagrantup.com/downloads.html)
* VirtualBox >= 4.3.10 (https://www.virtualbox.org/)

### Install

Clone this repo:

```$ git clone https://github.com/stefanvangastel/shipyard-vagrant.git```

Cd into the directory:

```$ cd shipyard-vagrant```

Run vagrant up:

```$ vagrant up```

This will set up 4 VM's: 1 containing the Shipyard application and 3 Docker hosts.

If all goes well you can go to this url and login to shipyard (admin:shipyard): http://10.245.1.2:8080

Using the Shipyard UI you can add the 3 engines, you can find the details below:

* docker-1, 1 cpu, 512MB, http://10.245.2.2:4500
* docker-2, 1 cpu, 512MB, http://10.245.2.3:4500
* docker-3, 1 cpu, 512MB, http://10.245.2.4:4500

Go bananas.
