
AR = ar
CC = gcc
CFLAGS = -m64 -Ofast -I"C:\mingw-w64\include" -w -s

OBJECT_FILES = bin/bitwise.o bin/framing.o bin/analysis.o bin/bitrate.o bin/block.o bin/codebook.o bin/envelope.o bin/floor0.o bin/floor1.o bin/info.o bin/lookup.o bin/lpc.o bin/lsp.o bin/mapping0.o bin/mdct.o bin/psy.o bin/registry.o bin/res0.o bin/sharedbook.o bin/smallft.o bin/synthesis.o bin/vorbisenc.o bin/window.o bin/vorbisfile.o

libvorbisogg.dll: $(OBJECT_FILES)
	$(CC) -o $@ -shared -fPIC $(CFLAGS) $^

bin/%.o: libvorbis/%.c
	$(CC) -o $@ -I"libvorbis" $< $(CFLAGS) -c

bin/%.o: libogg/%.c
	$(CC) -o $@ $< $(CFLAGS) -c
