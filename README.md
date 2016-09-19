lcd160x_driver
==============

A small linux kernel driver for LCD1602 and similiar displays connected via i2c. These displays are often used in arduino projects (https://arduino-info.wikispaces.com/LCD-Blue-I2C), so there really cheap and well known.

The driver is a character driver with write access. To clear the display (and run other functions of the hdd44780) ioctl's are implemented. Also a simle example on using it is included (see also https://github.com/tjohann/libbaalue.git).

WARNING: This is work in progress! Don't expect things to be complete in any dimension.


Requirement
-----------

You need at least gcc and kernel header to build the kernel driver and the hardware.

Used hardware: Bananapi-M1
Used defaults: I2C ...

![Alt text](pics/....png?raw=true "...")


Usage
-----

The simple user interface to this repository is a Makefile. So type

    make

to get more info.


(Un)Installation
----------------

The driver creates a dev node pcf8574_lcd160x below /dev. A udev rule (udev/99-lcd160x.rules) is available:

	KERNEL=="lcd160x", MODE="0666"


Build the module:

	make build

This will build the driver and the example program ()


Install all:	
	
	make install

This will install the driver to /lib/modules/$(shell uname -r)/kernel, install the udev rule 99-lcd160x.rules to /etc/udev/rules.d and the example program usage to ${HOME}/bin/usage_lcd160x 


To get rid of them use:

	make uninstall
	
This will remove all installed parts.

Summarize:

![Alt text](pics/driver_build.png?raw=true "Build kernel module")


Load driver
-----------

Load the diver

    sudo modprobe lcd160x.ko

Depending on your distribution you can see info message from the driver in /var/log/messages.

	(sudo) tail -n 50 -f /var/log/messages

Summarize:

![Alt text](pics/driver_load.png?raw=true "Load the kernel module")


Use driver
----------

The userspace example (usage_lcd160x) will be installed in $(HOME)/bin. If you have it in your $PATH, then you can simply tape

    usage_lcd160x  .....

and see in /var/log/messages what the driver is doing.

Summarize:

![Alt text](pics/driver_usage.png?raw=true "Usage of driver")


Documentation
-------------

Below the folder Documentation you can find information about the hardware and more.


Pictures/Test-environment
-------------------------

Here you find some pictures of the wiring and my test setup.

![Alt text](pics/overview.jpg?raw=true "Overview ...")
