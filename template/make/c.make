CC       = gcc
CFLAGS   = -Wall  -ggdb3 -Iinclude # debug: put -ggdb instead of -O3
LDFLAGS  = -L/usr/lib -L/usr/local/lib -L./lib 
LIBS     = -lmath
DEFS     = -D_DEBUG_ -D_MAIN_H_ 
GNUDEF   = -D_GNU_SOURCE
LPTHREAD = -lpthread
LIBNAME  = lib/lib.so
OBJECTS  = 
TESTFILS = 
VPATH    = src:include:test

all:$(LIBNAME)

$(LIBNAME):$(OBJECTS)
    $(CC) -shared -fPCI $(LDFLAGS) $(LPTHREAD) $^ -o $(LIBNAME)
    -rm -rf *.o

$(OBJECTS):%.o:%.c
    $(CC) -c $(CFLAGS) ${DEFS} ${GNUDEF} $^ -o $@

install:$(LIBNAME)
    -sudo cp $(LIBNAME) /usr/lib/

updatetags: 
	-find `pwd` -name "*.c" -o -name "*.h" > cscope.files
	-ctags -R --c-kinds=+p --fields=+iatS --extra=+q
	-cscope -Rbkq

clean:
	-find . \( -name '*.o' -o -name '*.so' -o -name '*.bak' -o -name 'tags' -o \
            -name '*.swp' -o -name '*.out' -o -name '*.gch' -o -name '*.*~' -o \
           -name 'core.*' -o -name '*.gch' -o -name '*.files' -o -name '$(TESTFILS)' \) -type f -execdir rm -f '{}' \; 

.PHONY: clean

