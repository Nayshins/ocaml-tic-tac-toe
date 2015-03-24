.PHONY: ttt clean test clean_test

ttt: src/main.ml
	corebuild src/main.native -r -Is src -pkg core -use-ocamlfind -quiet
	./main.native

test: test/testMain.ml
	corebuild test/testMain.native -r -Is src,test -pkg core -pkg oUnit -use-ocamlfind -quiet
	./testMain.native

clean: src/main.ml
	rm -rf _build
	corebuild src/main.native -r -Is src -pkg core -use-ocamlfind -quiet
	./main.native

clean_test: test/testMain.ml
	rm -rf _build
	corebuild test/testMain.native -r -Is src,test -pkg core -pkg oUnit -use-ocamlfind -quiet
	./testMain.native
