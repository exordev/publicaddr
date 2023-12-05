PREFIX=		${DESTDIR}/var/www
CGIDIR=		${PREFIX}/cgi-bin

LDFLAGS=	-static -pie
CFLAGS=		-O2 -W -Wall -Werror -Wextra -pedantic -ansi

all: usage publicaddr

.c.o:
	${CC} ${CFLAGS} -c $<

usage: usage.o
	${CC} -o $@ ${LDFLAGS} $?

publicaddr: publicaddr.o
	${CC} -o $@ ${LDFLAGS} $?

clean:
	rm -rf *.o *.core usage publicaddr

install: all
	mkdir -p ${CGIDIR}
	cp -Rp usage publicaddr ${CGIDIR}

uninstall:
	rm -rf ${CGIDIR}/{usage,publicaddr}

.PHONY: all clean install uninstall
