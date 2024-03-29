
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /opt/local/lib/ruby/1.8/i686-darwin10
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/opt/local
vendordir = $(DESTDIR)/opt/local/lib/ruby/vendor_ruby
oldincludedir = $(DESTDIR)/usr/include
docdir = $(datarootdir)/doc/$(PACKAGE)
libexecdir = $(exec_prefix)/libexec
sitedir = $(libdir)/ruby/site_ruby
datadir = $(datarootdir)
mandir = $(DESTDIR)/opt/local/share/man
vendorarchdir = $(vendorlibdir)/$(sitearch)
sharedstatedir = $(prefix)/com
sitearchdir = $(sitelibdir)/$(sitearch)
dvidir = $(docdir)
datarootdir = $(prefix)/share
localstatedir = $(prefix)/var
pdfdir = $(docdir)
infodir = $(datarootdir)/info
bindir = $(exec_prefix)/bin
sitelibdir = $(sitedir)/$(ruby_version)
psdir = $(docdir)
localedir = $(datarootdir)/locale
sbindir = $(exec_prefix)/sbin
libdir = $(exec_prefix)/lib
htmldir = $(docdir)
vendorlibdir = $(vendordir)/$(ruby_version)
sysconfdir = $(prefix)/etc
includedir = $(prefix)/include
rubylibdir = $(libdir)/ruby/$(ruby_version)
archdir = $(rubylibdir)/$(arch)

CC = /usr/bin/gcc-4.2
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -fno-common -pipe -O2 -arch x86_64  -fno-common -pipe -fno-common $(cflags) -arch x86_64
INCFLAGS = -I. -I. -I/opt/local/lib/ruby/1.8/i686-darwin10 -I.
DEFS     = 
CPPFLAGS = -DHAVE_SQLITE3_INITIALIZE -DHAVE_SQLITE3_NEXT_STMT -DHAVE_SQLITE3_BACKUP_INIT -I/usr/local/include -I/sw/local/include -I/usr/include -I/opt/local/include -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE  -I/opt/local/include
CXXFLAGS = $(CFLAGS) 
ldflags  = -L. -L/opt/local/lib -arch x86_64
dldflags = 
archflag = -arch x86_64
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = $(CC) -dynamic -bundle -undefined suppress -flat_namespace
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = i686-darwin10
sitearch = i686-darwin10
ruby_version = 1.8
ruby = /opt/local/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir) /usr/local/lib /opt/local/lib /sw/local/lib /usr/lib
LIBPATH =  -L. -L$(libdir) -L/usr/local/lib -L/opt/local/lib -L/sw/local/lib -L/usr/lib
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = /sqlite3
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -lsqlite3  -lpthread -ldl -lobjc  
SRCS = backup.c database.c exception.c sqlite3.c statement.c
OBJS = backup.o database.o exception.o sqlite3.o statement.o
TARGET = sqlite3_native
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /Users/meph/Documents/Projects/rails/cov_demo/capistrano/ruby/1.8/gems/sqlite3-1.3.3/lib$(target_prefix)
RUBYARCHDIR = /Users/meph/Documents/Projects/rails/cov_demo/capistrano/ruby/1.8/gems/sqlite3-1.3.3/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).bundle $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h
