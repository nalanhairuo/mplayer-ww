SRCS         += $(SRCS-yes)
SRCS2        += $(SRCS2-yes)
CFLAGS       += $(CFLAGS-yes)

OBJS  = $(addsuffix .o, $(basename $(SRCS)) )
OBJS2 = $(addsuffix .o, $(basename $(SRCS2)) )

CFLAGS += -I. -I.. $(OPTFLAGS)

LIBS = $(LIBNAME) $(LIBNAME2)

libs: $(LIBS)

$(LIBNAME): $(OBJS)
$(LIBNAME2): $(OBJS2)
$(LIBNAME) $(LIBNAME2):
	$(AR) r $@ $^
	$(RANLIB) $@

clean::
	rm -f *.o *.a *~

distclean:: clean
	rm -f .depend

dep depend:
	$(CC) -MM $(CFLAGS) $(SRCS) $(SRCS2) 1>.depend

-include .depend

.PHONY: libs clean distclean dep depend
