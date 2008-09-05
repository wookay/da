# Makefile
#                           wookay.noh at gmail.com

CLASSES=NSArrayControllerTest.o \
        NSBoxTest.o \
        NSViewTest.o \
        NSMutableAttributedStringTest.o
APP=test
UNITTEST=../unittest/UnitTest
CC=gcc
CFLAGS=-Wall -O7
LDFLAGS=-lobjc -framework AppKit

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
