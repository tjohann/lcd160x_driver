#
# build usage.c
#

CC = gcc
CFLAGS = -Wall -Wextra

PROG = usage
OBJ = usage.o

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

$(PROG): $(OBJ)
	gcc -o $@ $^

install: $(PROG)
	install $(PROG) $(HOME)/bin/$(PROG)_pcf8574_lcd160x

uninstall:
	rm -rf $(HOME)/bin/$(PROG)_pcf8574_lcd160x

clean:
	rm -rf *~
	rm -rf *.o
	rm -rf $(PROG)

distclean: clean

.PHONY: clean uninstall
