Vagrant::Config.run do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :shell, inline: "apt-get update -y"
  config.vm.provision :shell, inline: "apt-get install -y openjdk-7-jre"
  # Enable the Puppet provisioner
  config.vm.provision :puppet, :module_path => "puppet/modules", :manifests_path => "puppet"

  # Forward guest port 80 to host port 4567
  config.vm.forward_port 80, 4567
  config.vm.forward_port 8080, 8080
  config.vm.forward_port 9000, 9000
end
