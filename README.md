laravel
=======

###To launch the VM and use Laravel

* Get the required dependencies:
  * `Download Vagrant from:`
    * [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
  * `Download VirtualBox and the Extension Pack from:`
    * [https://www.virtualbox.org/](https://www.virtualbox.org/)

* Clone the repository and start the virtual machine (the first time will take awhile to boot)
  * `$ git clone https://github.com/kherrick/vagrant-environments laravel`
  * `$ cd laravel`
  * `$ git checkout laravel`
  * `$ bin/vm start`

* To turn off the virtual machine
  * `$ bin/vm stop`

* To login to the virtual machine
  * `$ bin/vm ssh`

* To see the site, browse to:
  * [http://localhost:8000/](http://localhost:8000/)

* Read more about Laravel development:
  * [http://laravel.com/docs/quick](http://laravel.com/docs/quick)

* For an alternative development environment, use Laravel Homestead:
  * [http://laravel.com/docs/homestead](http://laravel.com/docs/homestead)
