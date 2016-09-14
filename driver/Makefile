# Makefile for lcd160x.c
#
# GPL
# (c) 2016, thorsten.johannvorderbrueggen@t-online.de
#

DRIVER=lcd160x

ifneq ($(KERNELRELEASE),)
obj-m	:= $(DRIVER).o
else
KDIR	:= /lib/modules/$(shell uname -r)/build
PWD	:= $(shell pwd)

default:
	$(MAKE)	-C $(KDIR) M=$(PWD) modules
endif

clean:
	rm -f *~ *.o *.ko
	rm -f .built_in.o.cmd built_in.o
	rm -f Module.symvers modules.order
	rm -f .*.cmd *.ko *.mod.c
	rm -rf .tmp_versions

distclean: clean

install: default
	sudo cp $(DRIVER).ko /lib/modules/$(shell uname -r)/kernel
	sudo depmod -a

uninstall:
	sudo rm -rf /lib/modules/$(shell uname -r)/kernel/$(DRIVER).ko
	sudo depmod -a

.PHONY: clean uninstall
