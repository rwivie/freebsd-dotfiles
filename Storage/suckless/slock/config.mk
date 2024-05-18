# slock version
VERSION = 1.4

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

#X11INC = /usr/X11R6/include
#X11LIB = /usr/X11R6/lib

# FreeBSD (uncomment)
X11INC = /usr/local/include
X11LIB = /usr/local/lib

# freetype
FREETYPELIBS = -lXft
#FREETYPEINC = /usr/include/freetype2
# FreeBSD (uncomment)
FREETYPEINC = /usr/local/include/freetype2

# includes and libs
INCS = -I.  -I${X11INC}
LIBS =  -lc -lcrypt -L${X11LIB} -lX11 -lXext -lXrandr

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" -D_DEFAULT_SOURCE -DHAVE_PAM
CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS = -s ${LIBS} -lpam
COMPATSRC = explicit_bzero.c

# On OpenBSD and Darwin remove -lcrypt from LIBS
#LIBS =  -lc -L${X11LIB} -lX11 -lXext -lXrandr

# To enable PAM-based authentication, remove -DHAVE_PAM from CPPFLAGS
# and add -DHAVE_PAM instead. Also, add -lpam to LDFLAGS.
#
# On *BSD remove -DHAVE_PAM from CPPFLAGS
# On NetBSD add -D_NETBSD_SOURCE to CPPFLAGS
#CPPFLAGS = -DVERSION=\"${VERSION}\" -D_BSD_SOURCE -D_NETBSD_SOURCE
# On OpenBSD set COMPATSRC to empty
#COMPATSRC =

# compiler and linker
CC = cc
