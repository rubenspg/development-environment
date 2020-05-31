# Development Environment (Vagrant)
Linux development environment bootstrapped by Vagrant using VirtualBox.

## Requirements
In order to use this development environment you have to install the following tools:
- VirtualBox 
- Vagrant (>2.2.6)
- Vagrant Plugins:
  - vagrant-vbguest (https://github.com/dotless-de/vagrant-vbguest)
  - 
## OS
Ubuntu 20.04

## Installation
### Programming Languages
- Python3
- Go

### Tools
- Docker
- Terminator
- Visual Studio Code

## Usage
The installation will take around minutes to complete. It will download and install updates and the tools we specified.

To provision the VM, run:
```bash
vagrant up
```

A command line will appear in the end of the process. We want to access the user interface. So I recommend to execute the following:
```bash
vagrant halt && vagrant up
```

It will stop and start the VM again. At this time everything should come as expected. Login using the vagrant user and password: vagrant

### Additional configuration (manual)
To enabled the copy&paste between your Windows and the VM you can manually configure it going to your VirtualBox -> Devices -> Drag and Drop -> Bidirectional.
Do the same for Shared Clipboard.

If you VM window is smaller the your monitor size, you will need to install the VB Guest Additions.
You can follow [this instructions.](https://www.vagrantup.com/docs/virtualbox/boxes.html#additional-software)

### Troubleshooting
