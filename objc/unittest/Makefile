# Makefile
#                           wookay.noh at gmail.com

APP=test
CLASSES=Hello.o
UNITTEST=UnitTest
CC=gcc
CFLAGS=-Wall -O7
LDFLAGS=-lobjc -framework Foundation

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
	@rm -f *.o $(APP)
