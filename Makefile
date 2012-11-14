TRUEPREFIX?=	/usr/local

BINDIR 	=	${TRUEPREFIX}/bin
MANDIR	=	${TRUEPREFIX}/man/cat
PROG	=	ipcalc
CFLAGS	+=	-Wall -Werror -Wstrict-prototypes -g3

OBJS=compatibility.o ipcalc.o

.PHONY: clean install uninstall

ipcalc: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS)

clean:
	rm -f *.o
	rm -f ipcalc

install: ipcalc
	/usr/bin/install -c -m 0555 ipcalc $(BINDIR)
	/usr/bin/install -c -m 0444 ipcalc.1 $(MANDIR)

uninstall:
	rm -f $(BINDIR)/ipcalc
	rm -f $(MANDIR)/ipcalc.1