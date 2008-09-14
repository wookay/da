# Makefile
#                           wookay.noh at gmail.com

CLASSES=NSImageTest.o
APP=test
UNITTEST=../unittest/UnitTest
CC=gcc
CFLAGS=-Wall -O2
LDFLAGS=-framework AppKit

all: $(APP)

$(APP): $(APP).o $(UNITTEST).o $(CLASSES)
	$(CC) $(LDFLAGS) -o $@ $^ 

%.o: %.m
	$(CC) -c $(CFLAGS) $< -o $@

t: $(APP)
	@./$(APP)

p: $(APP)
	@PASSED=0 ./$(APP)
	
clean:
	@rm -f *.o $(APP) $(UNITTEST).o
