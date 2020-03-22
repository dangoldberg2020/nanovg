AR=ar
CC=cc
CFLAGS=-std=c11 -O2

SRCS=$(wildcard src/*.c)
OBJS=$(SRCS:src/%.c=bin/%.o)
HDRS=$(wildcard src/*.h)
LIB=bin/libnanovg.a
PC=nanovg.pc

$(LIB): $(OBJS)
	$(AR) rcs $@ $?

bin/%.o: src/%.c
	-@mkdir bin
	$(CC) $< $(CFLAGS) -c -o $@

install: $(LIB)
	-mkdir /usr/include/nanovg
	cp $(LIB) /usr/lib/
	cp $(HDRS) /usr/include/nanovg/
	-cp $(PC) /usr/lib/pkgconfig/

clean:
	rm -rf bin

.PHONY: install clean 

