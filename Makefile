.POSIX:

VERSION = 1.0

ifndef PREFIX
  PREFIX = /usr/local
endif
ifndef MANPREFIX
  MANPREFIX = ${PREFIX}/share/man
endif

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	sed "s/VERSION/${VERSION}/g" < pblocks > ${DESTDIR}${PREFIX}/bin/pblocks
	chmod 755 ${DESTDIR}${PREFIX}/bin/pblocks
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < pblocks.1 > ${DESTDIR}${MANPREFIX}/man1/pblocks.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/pblocks.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/pblocks
	rm -f ${DESTDIR}${MANPREFIX}/man1/pblocks.1

.PHONY: install uninstall
