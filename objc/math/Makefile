# Makefile
#                           wookay.noh at gmail.com

CLASSES=Vector.o \
        VectorTest.o
APP=test
UNITTEST=../unittest/UnitTest
CC=gcc
CFLAGS=-Wall -O7
LDFLAGS=-lobjc -framework QuartzCore -framework Foundation

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
