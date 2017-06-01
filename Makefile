#------------------------------------------------------------------------------
# program name  : Makefile
# version       : 1.0
# file          : ~jos/tape/Makefile
# author        : Rhodix IT services BV, Jos Schaeps
# date          : 28-Jan-95
# description   : makefile for chk_tape_write
# documentation : none
# modification  : 
#------------------------------------------------------------------------------
# these for different machines and stages of development
SHELL=/usr/bin/sh
RM=/usr/bin/rm
CC=cc
APPN= chk_tape_write
LFLAGS=
CFLAGS= -g
#------------------------------------------------------------------------------
# enscript related settings, depending on the OS version,
# edit it to your convenience.
PRINTCMD=$(ENSCRIPT) $(ENSCRIPT_FLAGS)
MPAGE=-A
PL_PATH=/opt/NeWSprint/pl.sun4
ENSCRIPT=/opt/NeWSprint/bin/enscript
ENSCRIPT_FLAGS=-2Gr -fCourier11
#------------------------------------------------------------------------------

all: help  

help: 
	@echo "Makefile for chk_tape_write"
	@echo "available targets are :"
	@echo "\tsunos4 : builds the sunos 4.x version"
	@echo "\tsunos5 : builds the sunos 5.x version"
	@echo "\tprint  : prints the source code, Makefile and manual page"

sunos4:
	$(RM) $(APPN)
	$(CC) -o $(APPN) $(CFLAGS) -DSUNOS4 $(APPN).c

sunos5:
	$(RM) $(APPN)
	$(CC) -o $(APPN) $(CFLAGS) -DSUNOS5 $(APPN).c

print:
	$(PRINTCMD) $(APPN).c
	$(PRINTCMD) Makefile
	man -M ./ -s l $(APPN) | lp

clean:
	$(RM) $(APPN) a.out core
#----------------------- end of Makefile --------------------------------------
