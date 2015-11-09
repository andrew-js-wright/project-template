Vagrant::configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.provision :shell, inline: "apt-get update -y"
  config.vm.provision :shell, inline: "apt-get install -y puppet"
  # Enable the Puppet provisioner
  config.vm.provision :puppet, :module_path => "puppet/modules", :manifests_path => "puppet"

  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "127.0.0.1"

  config.vm.provider :aws do |aws, override|
       aws.access_key_id = ENV['AWS_KEY']
       aws.secret_access_key = ENV['AWS_SECRET']
       aws.keypair_name = ENV['AWS_KEYNAME']
       aws.ami = "ami-47a23a30"
       aws.region = "eu-west-1"
       aws.instance_type = "t2.micro"
       aws.security_groups = "project-drill"

       override.vm.box = "dummy"
       override.ssh.username = "ubuntu"
       override.ssh.private_key_path = "/Users/andrewwr/.ssh/id_rsa" #ENV['AWS_KEYPATH']
  end
end
