PREFIX=		${DESTDIR}/var/www
CGIDIR=		${PREFIX}/cgi-bin

CFLAGS=		-O2 -W -Wall -Werror -Wextra -pedantic -ansi
LDFLAGS=	-static -pie

all: publicaddr

.c.o:
	${CC} ${CFLAGS} -c $<

publicaddr: publicaddr.o
	${CC} -o $@ ${LDFLAGS} $?

clean:
	rm -rf *.o *.core publicaddr

install: all
	mkdir -p ${CGIDIR}
	cp -p publicaddr ${CGIDIR}

uninstall:
	rm -rf ${CGIDIR}/publicaddr

.PHONY: all clean install uninstall
