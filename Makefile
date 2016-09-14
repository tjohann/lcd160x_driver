#
# my simple makefile act as something like a user interface
#

CLEAN = $(shell ls -d */ | cut -f1 -d'/')
BUILD = driver 		\
	usage           \
	udev

PWD=$(shell pwd)

all:
	@echo "  +----------------------------------------------------------+"
	@echo " /                                                          /|"
	@echo "+----------------------------------------------------------+ |"
	@echo "| Usage:                                                   | |"
	@echo "| make build     -> build everthing                        | |"
	@echo "| make install   -> build_all + install (driver + examples)| |"
	@echo "| make uninstall -> uninstall all                          | |"
	@echo "| make clean     -> clean all dir/subdirs                  | +"
	@echo "| make distclean -> complete cleanup                       |/ "
	@echo "+----------------------------------------------------------+  "

build: driver usage	

driver:
	@echo "+------------------------------------------------------------+"
	@echo "|   build $@ in $(PWD)"
	@echo "+------------------------------------------------------------+"
	(cd $@ && $(MAKE))

usage:
	@echo "+------------------------------------------------------------+"
	@echo "|   build $@ in $(PWD)"
	@echo "+------------------------------------------------------------+"

	(cd $@ && $(MAKE))

install:
	for dir in $(BUILD); do (cd $$dir && $(MAKE) $@); done

uninstall:
	for dir in $(BUILD); do (cd $$dir && $(MAKE) $@); done

clean:
	rm -f *~ .*~
	for dir in $(CLEAN); do (cd $$dir && $(MAKE) $@); done

distclean:
	rm -f *~ .*~
	for dir in $(CLEAN); do (cd $$dir && $(MAKE) $@); done

.PHONY: all clean distclean driver usage install uninstall
