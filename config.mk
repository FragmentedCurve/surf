# surf version
VERSION = 2.0

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man
LIBPREFIX = $(PREFIX)/lib/surf

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

GTKINC = `pkg-config --cflags gtk+-3.0 gcr-3 webkit2gtk-4.0`
GTKLIB = `pkg-config --libs gtk+-3.0 gcr-3 webkit2gtk-4.0`
WEBEXTINC = `pkg-config --cflags webkit2gtk-4.0 webkit2gtk-web-extension-4.0`
WEBEXTLIB = `pkg-config --libs webkit2gtk-4.0 webkit2gtk-web-extension-4.0`

# includes and libs
INCS = -I$(X11INC) $(GTKINC)
LIBS = -L$(X11LIB) -lX11 $(GTKLIB) -lgthread-2.0

# flags
CPPFLAGS = -DVERSION=\"$(VERSION)\" -DWEBEXTDIR=\"$(LIBPREFIX)\" \
           -D_DEFAULT_SOURCE -DGCR_API_SUBJECT_TO_CHANGE
SURFCFLAGS = $(INCS) $(CPPFLAGS) $(CFLAGS)
SURFLDFLAGS = $(LIBS) $(LDFLAGS)
LIBCPPFLAGS = -DWEBEXTDIR=\"$(LIBPREFIX)\"
LIBCFLAGS = $(WEBEXTINC) $(LIBCPPFLAGS) $(CFLAGS)
LIBLDFLAGS = $(WEBEXTLIB) $(LDFLAGS)

# Solaris
#CFLAGS = -fast $(INCS) -DVERSION=\"$(VERSION)\"
#LDFLAGS = $(LIBS)

# compiler and linker
#CC = c99
LIBTOOL = libtool --quiet
