# Makefile
#                           wookay.noh at gmail.com

all:
	cd unittest && make && ./test
	cd foundation && make && ./test
	cd appkit && make && ./test
	cd quartzcore && make && ./test
	cd scriptingbridge && make && ./test

passed:
	cd unittest && make && PASSED=0 ./test
	cd foundation && make && PASSED=0 ./test
	cd appkit && make && PASSED=0 ./test
	cd quartzcore && make && PASSED=0 ./test
	cd scriptingbridge && make && PASSED=0 ./test

clean:
	cd unittest && make clean
	cd foundation && make clean
	cd appkit && make clean
	cd quartzcore && make clean
	cd scriptingbridge && make clean
