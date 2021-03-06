# Makefile for UD CISC user-level thread library

CC = gcc
CFLAGS = -g -Wall -Wextra

LIBOBJS = t_lib.o 

TSTOBJS = test00.o test01.o test01a.o test01x.o test01-shone.o test01-sullivan.o test02.o test02a.o test02.o test04.o test07.o test03.o test03-shone.o test03-phil.o test10.o test03-senzer.o test06.o test05.o test08.o test09.o test11.o test04-senzer.o

# specify the executable 

EXECS = test00 test01 test01a test01x test01-shone test01-sullivan test02 test02a test04 test07 test03 test03-shone test03-phil test10 test03-senzer test06 test05 test08 test09 test11 test04-senzer

# specify the source files

LIBSRCS = t_lib.c

TSTSRCS = test00.c test01.c test01a.c test01x.c test01-shone.c test01-sullivan.c test02.c test02a.c test04.c test07.c test03.c test03-shone.c test03-phil.c test10.c test03-senzer.c test06.c test05.c test08.c test09.c test11.c test04-senzer.c

#default target
.DEFAULT_GOAL := all
all: test00 test01 test01a test01x test01-shone test01-sullivan test02 test02a test04 test07 test03 test03-shone test03-phil test10 test03-senzer test06 test05 test08 test09 test11 test04-senzer

# ar creates the static thread library

t_lib.a: ${LIBOBJS} Makefile
	ar rcs t_lib.a ${LIBOBJS}

# here, we specify how each file should be compiled, what
# files they depend on, etc.

t_lib.o: t_lib.c t_lib.h Makefile
	${CC} ${CFLAGS} -c t_lib.c

test00.o: test00.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test00.c

test01.o: test01.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01.c

test01a.o: test01a.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01a.c

test01x.o: test01x.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01x.c

test01-shone.o: test01-shone.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01-shone.c

test01-sullivan.o: test01-sullivan.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01-sullivan.c

test02.o: test02.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test02.c

test04.o: test04.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test04.c

test07.o: test07.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test07.c

test02a.o: test02a.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test02a.c

test00: test00.o t_lib.a Makefile
	${CC} ${CFLAGS} test00.o t_lib.a -o test00

test01: test01.o t_lib.a Makefile
	${CC} ${CFLAGS} test01.o t_lib.a -o test01

test01a: test01a.o t_lib.a Makefile
	${CC} ${CFLAGS} test01a.o t_lib.a -o test01a

test01x: test01x.o t_lib.a Makefile
	${CC} ${CFLAGS} test01x.o t_lib.a -o test01x

test01-shone: test01-shone.o t_lib.a Makefile
	${CC} ${CFLAGS} test01-shone.o t_lib.a -o test01-shone

test01-sullivan: test01-sullivan.o t_lib.a Makefile
	${CC} ${CFLAGS} -pthread test01-sullivan.o t_lib.a -o test01-sullivan

test02: test02.o t_lib.a Makefile
	${CC} ${CFLAGS} test02.o t_lib.a -o test02

test02a: test02a.o t_lib.a Makefile
	${CC} ${CFLAGS} test02a.o t_lib.a -o test02a

test04: test04.o t_lib.a Makefile
	${CC} ${CFLAGS} test04.o t_lib.a -o test04

test07: test07.o t_lib.a Makefile
	${CC} ${CFLAGS} test07.o t_lib.a -o test07
	
test03: test03.o t_lib.a Makefile
	${CC} ${CFLAGS} test03.o t_lib.a -o test03
	
test03-shone: test03-shone.o t_lib.a Makefile
	${CC} ${CFLAGS} test03-shone.o t_lib.a -o test03-shone
	
test03-phil: test03-phil.o t_lib.a Makefile
	${CC} ${CFLAGS} test03-phil.o t_lib.a -o test03-phil
	
test10: test10.o t_lib.a Makefile
	${CC} ${CFLAGS} test10.o t_lib.a -o test10
	
test03-senzer: test03-senzer.o t_lib.a Makefile
	${CC} ${CFLAGS} test03-senzer.o t_lib.a -o test03-senzer
	
test06: test06.o t_lib.a Makefile
	${CC} ${CFLAGS} test06.o t_lib.a -o test06
	
test05: test05.o t_lib.a Makefile
	${CC} ${CFLAGS} test05.o t_lib.a -o test05
	
test08: test08.o t_lib.a Makefile
	${CC} ${CFLAGS} test08.o t_lib.a -o test08
	
test09: test09.o t_lib.a Makefile
	${CC} ${CFLAGS} test09.o t_lib.a -o test09
	
test11: test11.o t_lib.a Makefile
	${CC} ${CFLAGS} test11.o t_lib.a -o test11
	
test04-senzer: test04-senzer.o t_lib.a Makefile
	${CC} ${CFLAGS} test04-senzer.o t_lib.a -o test04-senzer

clean:
	rm -f t_lib.a ${EXECS} ${LIBOBJS} ${TSTOBJS} 
