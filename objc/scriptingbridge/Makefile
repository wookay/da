# Makefile
#                           wookay.noh at gmail.com

CLASSES=SBElementArrayTest.o
APP=test
UNITTEST=../unittest/UnitTest
CC=gcc
CFLAGS=-Wall -O7
LDFLAGS=-lobjc -framework ScriptingBridge -framework Foundation

all: $(APP)

$(APP): $(APP).o $(UNITTEST).o $(CLASSES)
	$(CC) $(LDFLAGS) -o $@ $^ 

%.o: %.m
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	@rm -f *.o $(APP) $(UNITTEST).o
