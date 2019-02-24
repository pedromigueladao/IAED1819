src = $(wildcard *.c)
progs = $(patsubst %.c,%,$(wildcard *.c))

.PHONY: all

all:$(progs)

%: %.c makefile
	@echo "Compiling" $@
	@gcc -g -Wextra -Wall -ansi -pedantic -o $@ $<

clean:
	@rm -fv $(progs)
