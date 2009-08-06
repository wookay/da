hello:
	@gcc src/rfwav.c -o rfwav
	@ruby src/choon.rb hello.choon > hello.choonout
	@./rfwav < hello.choonout > hello.wav
	@rm hello.choonout rfwav
	@echo "open hello.wav"

clean:
	rm *wav
