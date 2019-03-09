Gozma
=====

Easily vagrant up the latest ubuntu LTS machine.


Accessing Globally
------------------

Sometimes you may want to `vagrant up` your Gozma machine from anywhere on your filesystem. You can do this on Mac / Linux systems by adding a Bash function to your Bash profile. Here goes a nice sample:

```bash
gozma() {
  if [ "destroy" == $1 ];
  then
    echo "Sorry, the '$1' command is not encouraged!"
    return 1
  fi

  ( cd /opt/vagrant-local/gozma && vagrant $* )
}
```

Make sure to tweak the `/opt/vagrant-local/gozma` path in the function to the location of your actual Gozma installation. Once the function is installed, you may run commands like `gozma up` or `gozma ssh` from anywhere on your system.


The Hosts File
--------------

You must add the "domains" for your sites to the `hosts` file on your machine. The `hosts` file will redirect requests for your sites into your Gozma machine. On Mac and Linux, this file is located at `/etc/hosts`. The lines you add to this file will look like the following:

~~~
192.168.27.10 gozma.local
~~~
