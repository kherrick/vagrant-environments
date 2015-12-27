nodejs-nodejsAngularTodo
========================

###To launch the VM and use Node.js

* Get the required dependencies:
  * `Download Vagrant from:`
    * [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
  * `Download VirtualBox and the Extension Pack from:`
    * [https://www.virtualbox.org/](https://www.virtualbox.org/)

* Clone the repository and start the virtual machine (the first time will take awhile to boot)
  * `$ git clone https://github.com/kherrick/vagrant-environments nodejs-nodejsAngularTodo`
  * `$ cd nodejs-nodejsAngularTodo`
  * `$ git checkout nodejs-nodejsAngularTodo`
  * `$ bin/vm start`

* To turn off the virtual machine
  * `$ bin/vm stop`

* To login to the virtual machine
  * `$ bin/vm ssh`

###To initialize the application

* Run the following:
  * `$ bin/vm npm install`
  * `$ bin/vm nodemon server.js`
* Browse to:
  * `http://localhost:8081`