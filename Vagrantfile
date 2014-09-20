# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "testbox.local" => "192.168.33.10"
}

Vagrant.configure("2") do |config|
  hosts.each do |name, ip|
    config.vm.define name do |machine|
      machine.vm.box = "ubuntu/trusty64"
      machine.vm.hostname = name
      machine.vm.network :private_network, ip: ip

      machine.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--ioapic", "on"]
      end

      ssh_pubkey = File.read(File.join(Dir.home, ".ssh", "id_rsa.pub"))
      machine.vm.provision :shell, :inline => "echo '#{ssh_pubkey}' >> /home/vagrant/.ssh/authorized_keys && chmod 600 /home/vagrant/.ssh/authorized_keys"

      # Though having Vagrant automatically run Ansible is nice, we don't have
      # a great way of saying "the first time, run the bootstrap.yml playbook,
      # and any time after that, run the site.yml playbook."
      #
      # Instead, just run `bin/testbootstrap testing.hosts`, and then
      # `bin/testrun testing.hosts` any time thereafter.
      #
      # machine.vm.provision :ansible do |ansible|
      #   ansible.playbook = "site.yml"
      #   ansible.extra_vars = { ansible_ssh_user: "vagrant", sudo: true, testing: true }
      #   ansible.host_key_checking = false
      #   # ansible.verbose = "vvvv"
      # end
    end
  end
end
