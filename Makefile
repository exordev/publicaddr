PREFIX?=	${DESTDIR}/var
CGIDIR=		${PREFIX}/www/cgi-bin

CFLAGS=		-O2 -g -W -Wall -Werror -Wextra -pedantic -ansi
LDFLAGS=	-static -pie

all: publicaddr

.c.o:
	${CC} ${CFLAGS} -o $@ -c $<

publicaddr: publicaddr.o
	${CC} -o $@ ${LDFLAGS} publicaddr.o

install:
	install -d ${CGIDIR}
	install -m 0500 publicaddr ${CGIDIR}

uninstall:
	rm -rf ${CGIDIR}/publicaddr

clean:
	rm -f *.{o,core} publicaddr

.PHONY: all clean install uninstall
