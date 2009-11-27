include $(GOROOT)/src/Make.$(GOARCH)
TARG=test
GOFILES=test.go
include $(GOROOT)/src/Make.cmd

p:
	@make > /dev/null
	@./test
	@rm *.8 test
