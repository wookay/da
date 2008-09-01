# Makefile
#                           wookay.noh at gmail.com

APP=numero
ERL=erl

all: $(APP)

$(APP):
	$(ERL)c $(APP).$(ERL)
	$(ERL) -eval "$(APP):$(APP)()." -noshell -s init stop

clean:
	rm -f *beam *dump
