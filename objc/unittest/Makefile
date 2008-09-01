# Makefile
#                           wookay.noh at gmail.com

APP=test
UNITTEST=UnitTest
CC=gcc
CFLAGS=-Wall -O7
LDFLAGS=-lobjc -framework Foundation

all: $(APP)

$(APP): $(APP).o $(UNITTEST).o
	$(CC) $(LDFLAGS) -o $@ $^ 

%.o: %.m
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	@rm -f *.o $(APP)
