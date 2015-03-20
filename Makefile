.PHONY: ttt clean test

ttt: src/main.ml
	corebuild src/main.native -r -Is src -pkg core -use-ocamlfind -quiet
	./main.native

test: test/testMain.ml
	corebuild test/testMain.native -r -Is src,test -pkg core -pkg oUnit -use-ocamlfind -quiet
	./testMain.native
