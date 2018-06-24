# -*- mode: ruby -*-
# vi: set ft=ruby :

$install_python_script = <<SCRIPT

echo "installing python..."
# install epel-release on centos
#  sudo  yum -y install epel-release
  sudo apt update

# install python-pip from epel
  sudo  apt install -y python-pip

# Upgrade pip
   sudo pip install --upgrade pip
echo "Python Installed!"

sudo apt upgrade -y 
SCRIPT

$install_socat_script = <<SCRIPT

echo 'installing socat...'
sudo apt install -y socat

SCRIPT

Vagrant.configure("2") do |config|

   ######## CONTROLLERS #########

   config.vm.define "lb" do |lb|
        lb.vm.box = "bento/ubuntu-18.04"
        lb.vm.hostname = "k8sbox-lb"
        lb.vm.network "private_network", ip: "192.168.44.10"
        lb.vm.network "forwarded_port", guest: 8080, host: 18080
        lb.vm.network "forwarded_port", guest: 6443, host: 16443
        lb.vm.provision "shell", inline: $install_python_script
        lb.vm.synced_folder "./.vm_data", "/vagrant", type: "sshfs"
        lb.vm.provider "virtualbox" do |v|
          v.name = "k8sbox_lb"
          v.memory = 2048
          v.cpus = 2
        end
    end

   config.vm.define "controller1" do |controller1|
        controller1.vm.box = "bento/ubuntu-18.04"
        controller1.vm.hostname = "k8sbox-c1"
        controller1.vm.network "private_network", ip: "192.168.44.11"
        controller1.vm.provision "shell", inline: $install_python_script
        controller1.vm.synced_folder "./.vm_data", "/vagrant", type: "sshfs"
        controller1.vm.provider "virtualbox" do |v|
          v.name = "k8sbox_controller1"
          v.memory = 2048
          v.cpus = 2
        end
   end

   config.vm.define "controller2" do |controller2|
        controller2.vm.box = "bento/ubuntu-18.04"
        controller2.vm.hostname = "k8sbox-c2"
        controller2.vm.network "private_network", ip: "192.168.44.12"
        controller2.vm.provision "shell", inline: $install_python_script
        controller2.vm.synced_folder "./.vm_data", "/vagrant", type: "sshfs"
        controller2.vm.provider "virtualbox" do |v|
          v.name = "k8sbox_controller2"
          v.memory = 2048
          v.cpus = 2
        end
    end


   ######## WORKERS #########

   config.vm.define "worker1" do |worker1|
     worker1.vm.box = "bento/ubuntu-18.04"
     worker1.vm.hostname = "k8sbox-w1"
     worker1.vm.network "private_network", ip: "192.168.44.21"
     worker1.vm.provision "shell", inline: $install_python_script
     worker1.vm.provision "shell", inline: $install_socat_script
     worker1.vm.provision "shell", inline: "swapoff -a"
     worker1.vm.synced_folder "./.vm_data", "/vagrant", type: "sshfs"
     worker1.vm.provider "virtualbox" do |v|
          v.name = "k8sbox_worker1"
          v.memory = 2048
          v.cpus = 2
     end
   end

   config.vm.define "worker2" do |worker2|
     worker2.vm.box = "bento/ubuntu-18.04"
     worker2.vm.hostname = "k8sbox-w2"
     worker2.vm.network "private_network", ip: "192.168.44.22"
     worker2.vm.provision "shell", inline: $install_python_script
     worker2.vm.provision "shell", inline: $install_socat_script
     worker2.vm.provision "shell", inline: "swapoff -a"
     worker2.vm.synced_folder "./.vm_data", "/vagrant", type: "sshfs"
     worker2.vm.provider "virtullalbox" do |v|
          v.name = "k8sbox_worker2"
          v.memory = 2048
          v.cpus = 2
    end
   end

end
