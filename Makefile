.PHONY: ttt clean test clean_test

default: src/main.ml
	corebuild src/main.native -r -cflags -w,-48 -Is src -pkg core -use-ocamlfind -quiet

run: src/main.ml
	./main.native

test: test/testMain.ml
	corebuild test/testMain.native -r -cflags -w,-48 -Is src,test -pkg core -pkg oUnit -use-ocamlfind -quiet
	./testMain.native

clean: src/main.ml
	corebuild src/main.native -clean -r -Is src -pkg core -use-ocamlfind -quiet -cflags -w,-48

clean_test: test/testMain.ml
	corebuild test/testMain.native -clean -r -cflags -w,-48 -Is src,test -pkg core -pkg oUnit -use-ocamlfind -quiet
	./testMain.native
