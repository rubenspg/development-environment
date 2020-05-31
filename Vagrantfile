Vagrant.configure("2") do |config|
    # VM Properties
    config.vm.box = "bento/ubuntu-20.04"
    config.vm.define 'mydev'
    config.vm.hostname = 'mydev'
#    config.disksize.size = '20GB'

    # Port-Forwarding
    # http/https
    config.vm.network :forwarded_port, guest: 8080,  host: 8080,  auto_correct: true
    config.vm.network :forwarded_port, guest: 8443,  host: 8443,  auto_correct: true
     # go
    config.vm.network :forwarded_port, guest: 3999,  host: 3999,  auto_correct: true
    config.vm.network :public_network, bridge: 'eth0'

    # Provisioning
    config.vm.provision :shell, path: 'installation/apt.sh', name: 'apt packages install'
    config.vm.provision :shell, path: 'installation/guest-adds.sh', name: 'VB Guest Additions'
    config.vm.provision :shell, path: 'installation/golang.sh', name: 'Go setup'
    config.vm.provision :shell, path: 'installation/python3.sh', name: 'Python 3 setup'

    config.vm.provider :virtualbox do |vb|
        vb.name = 'mydev'
        vb.gui = true
        vb.customize ['modifyvm', :id, '--memory', '8192']
        vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
        vb.customize ['modifyvm', :id, '--vram', '128']
        vb.customize ['modifyvm', :id, '--cpus', '2']
        vb.customize ['modifyvm', :id, '--ioapic', 'on']
        vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
        vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
      end
end
