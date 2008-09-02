# Makefile
#                           wookay.noh at gmail.com

CLASSES=NSObjectTest.o \
        NSNumberTest.o \
        NSStringTest.o \
        NSArrayTest.o \
        NSMutableArrayTest.o \
        NSMutableSetTest.o \
        NSMutableDictionaryTest.o
APP=test
UNITTEST=../unittest/UnitTest
CC=gcc
CFLAGS=-Wall -O7
LDFLAGS=-lobjc -framework Foundation

all: $(APP)

$(APP): $(APP).o $(UNITTEST).o $(CLASSES)
	$(CC) $(LDFLAGS) -o $@ $^ 

%.o: %.m
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	@rm -f *.o $(APP) $(UNITTEST).o
