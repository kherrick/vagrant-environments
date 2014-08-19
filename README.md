vagrant-erlang
================

###To launch the VM and use Erlang

* Get the required dependencies:
  * Download `Vagrant` from: [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
  * Download `VirtualBox` and the Extension Pack from: [https://www.virtualbox.org/](https://www.virtualbox.org/)
  * Download `git` from: [http://git-scm.com/download](http://git-scm.com/download)

* Clone the repository and start the virtual machine (the first time will take awhile to boot)
  * `$ git clone https://github.com/kherrick/vagrant-erlang`
  * `$ cd vagrant-erlang/`
  * `$ bin/vm start`

* To turn off the virtual machine
  * `$ bin/vm stop`

* To login to the virtual machine
  * `$ bin/vm ssh`

### More info

* For convenience:
  * When ssh'ing into the guest via `bin/vm ssh`, you will automatically be dropped into the `/vagrant` folder (the shared folder / project root).
  * By default, guest port `80` is forwarded to host port `8888`. To access it from the host, reference `localhost:8888`.

* Shell commands targeted at the VM can run from within after ssh'ing inside of it, or from the host.
  * Example: from the host, try running `$ bin/vm rebar` from the project root.

* Erlang was installed with `apt-get` from official Ubuntu sources and can be executed by running the `erl` command.

* Rebar was installed from [https://github.com/rebar/rebar](https://github.com/rebar/rebar) and can be executed by running the `rebar` command.

### Issues

* Using the current setup, the puppet provisioner will issue warnings during the initial `bin/vm start`. See [https://github.com/mitchellh/vagrant/issues/3740](https://github.com/mitchellh/vagrant/issues/3740) for more information.
