silex
======

A silex boilerplate. Uses nginx for the web server and twig for the templating engine. To view, browse to [http://localhost:8088](http://localhost:8088) after launching the VM.

###To launch the VM:

* Get the required dependencies:
  * `Download Vagrant from:`
    * [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
  * `Download VirtualBox and the Extension Pack from:`
    * [https://www.virtualbox.org/](https://www.virtualbox.org/)

* Clone the repository and start the virtual machine (the first time will take awhile to boot)
  * `$ git clone https://github.com/kherrick/vagrant-environments silex`
  * `$ cd silex`
  * `$ git checkout silex`
  * `$ bin/vm start`

* To turn off the virtual machine
  * `$ bin/vm stop`

* To login to the virtual machine
  * `$ bin/vm ssh`

###Other useful commands

* `bin/composer install` (install php dependencies)
* `bin/unit-test-php.sh` (starts the boilerplate PHPUnit tests)
* `bin/tail-error-log.sh` (runs tail against the nginx error log inside the virtual machine)
