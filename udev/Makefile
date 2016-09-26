#
# my simple makefile act as something like a user interface
#

install:
	sudo install -m 644 99-lcd160x.rules /etc/udev/rules.d/99-lcd160x.rules

uninstall:
	sudo rm -rf /etc/udev/rules.d/99-lcd160x.rules

clean:
	rm -f *~ .*~

distclean: clean


.PHONY: all clean install uninstall
