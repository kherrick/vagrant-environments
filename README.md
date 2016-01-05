koa
======

A babel, koa, node, and gulp boilerplate.

###Launch the virtual machine:

* Get the required dependencies:
  * `Download Vagrant from:`
    * [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
  * `Download VirtualBox and the Extension Pack from:`
    * [https://www.virtualbox.org/](https://www.virtualbox.org/)

* Clone the repository and start the virtual machine (the first time will take awhile to boot)
  * `$ git clone https://github.com/kherrick/vagrant-environments koa`
  * `$ cd koa`
  * `$ git checkout koa`
  * `$ bin/vm start`

* To turn off the virtual machine
  * `$ bin/vm stop`

* To login to the virtual machine
  * `$ bin/vm ssh`

###Install other dependencies:

* `bin/vm npm install`

###To develop against the boilerplate:

* Launch a terminal and execute: `bin/vm npm run watch-client` (watch and rebuild client side code)
* Launch another terminal and execute: `bin/vm npm run watch-server` (watch and reload the server)

###To run the project

* `bin/vm npm run app`
