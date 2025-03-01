CC = gcc 
CFLAGS = -std=c99 \
	-EB \
	-march=74kc -mips16 -mdsp \
	-O2 \
	-flto \
	-s -ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -Wl,--strip-all

STRIP = strip

all: tiny

tiny: tiny_web_server_jmjatlanta.c
	$(CC) $(CFLAGS) -o tiny tiny_web_server_jmjatlanta.c
	$(STRIP) --remove-section=.note.ABI-tag --remove-section=.comment --remove-section=.gnu.version -g -s tiny

clean:
	rm -f *.o tiny *~


# old
#CC = c99
#CFLAGS = -Wall -O2
## LIB = -lpthread
#all: tiny
#tiny: tiny.c
#       $(CC) $(CFLAGS) -o tiny tiny.c $(LIB)
#clean:
#       rm -f *.o tiny *~
