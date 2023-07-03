CC = gcc
CFLAGS = -Isod -shared -Wall -fPIC -std=c99
SRCS = sod/sod.c sod/wrapper.c
ifeq ($(OS),Windows_NT)
    TARGET = resources/libraries/libsod.dll
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        TARGET = resources/libraries/libsod.so
    endif
    ifeq ($(UNAME_S),Darwin)
        TARGET = resources/libraries/libsod.dylib
    endif
endif


all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(TARGET)