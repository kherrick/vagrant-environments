wordpress
=========

###To launch the VM and use WordPress

* Get the required dependencies:
  * `Download Vagrant from:`
    * [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
  * `Download VirtualBox and the Extension Pack from:`
    * [https://www.virtualbox.org/](https://www.virtualbox.org/)

* Clone the repository and start the virtual machine (the first time will take awhile to boot)
  * `$ git clone https://github.com/kherrick/vagrant-environments wordpress`
  * `$ cd wordpress/`
  * `$ git checkout wordpress`
  * `$ bin/vm start`

* To turn off the virtual machine
  * `$ bin/vm stop`

* To login to the virtual machine
  * `$ bin/vm ssh`

* Browse to the site
  * [http://localhost:8080](http://localhost:8080)

* Default credentials for WordPress:
  * username: `vagrant`
  * password: `vagrant`

* Default credentials for MySQL:
  * username: `root`
  * password: `vagrant`

* WordPress can be found within the virtual machine at `/var/www/html/`
