# -*- mode: ruby -*-
# vi: set ft=ruby :

$install_python_script = <<SCRIPT

echo "installing python..."
sudo apt-get -y install python

echo "Python Installed!"

SCRIPT


Vagrant.configure("2") do |config|

   ######## CONTROLLERS #########

   config.vm.define "lb" do |lb|
        lb.vm.box = "ubuntu/xenial64"
        lb.vm.hostname = "k8sv161-lb"
        lb.vm.network "private_network", ip: "192.168.44.10"
        lb.vm.network "forwarded_port", guest: 8080, host: 18080
        lb.vm.provision "shell", inline: $install_python_script
        lb.vm.provider "virtualbox" do |v|
          v.name = "k8sv161_lb"
          v.memory = 2048
          v.cpus = 2
        end
    end

   config.vm.define "controller1" do |controller1|
        controller1.vm.box = "ubuntu/xenial64"
        controller1.vm.hostname = "k8sv161-c1"
        controller1.vm.network "private_network", ip: "192.168.44.11"
        controller1.vm.provision "shell", inline: $install_python_script
        controller1.vm.provider "virtualbox" do |v|
          v.name = "k8sv161_controller1"
          v.memory = 2048
          v.cpus = 2
        end
   end

   config.vm.define "controller2" do |controller2|
        controller2.vm.box = "ubuntu/xenial64"
        controller2.vm.hostname = "k8sv161-c2"
        controller2.vm.network "private_network", ip: "192.168.44.12"
        controller2.vm.provision "shell", inline: $install_python_script
        controller2.vm.provider "virtualbox" do |v|
          v.name = "k8sv161_controller2"
          v.memory = 2048
          v.cpus = 2
        end
    end


   ######## WORKERS #########

   config.vm.define "worker1" do |worker1|
     worker1.vm.box = "ubuntu/xenial64"
     worker1.vm.hostname = "k8sv161-w1"
     worker1.vm.network "private_network", ip: "192.168.44.21"
     worker1.vm.provision "shell", inline: $install_python_script
     worker1.vm.provider "virtualbox" do |v|
          v.name = "k8sv161_worker1"
          v.memory = 2048
          v.cpus = 2
     end
   end

   config.vm.define "worker2" do |worker2|
     worker2.vm.box = "ubuntu/xenial64"
     worker2.vm.hostname = "k8sv161-w2"
     worker2.vm.network "private_network", ip: "192.168.44.22"
     worker2.vm.provision "shell", inline: $install_python_script
     worker2.vm.provider "virtullalbox" do |v|
          v.name = "k8sv161_worker2"
          v.memory = 2048
          v.cpus = 2
    end
   end

end
