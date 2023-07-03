CC = gcc
CFLAGS = -I. -shared -Wall -fPIC -std=c99
SRCS = resources/sod.c resources/wrapper.c
ifeq ($(OS),Windows_NT)
    TARGET = resources/libraries/libsod.dll
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        TARGET = resources/libraries/libsod.so
    endif
endif


all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(TARGET)