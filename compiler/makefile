compiler:
	bison -d compiler.y
	flex compiler.l
	clang -g -o compiler lex.yy.c compiler.tab.c 

clean:
	rm -f bison.tab.c bison.tab.h lex.yy.c compiler
	
interpreter:
	clang++ -Wall -std=c++11 interpreter.cc -o interpreter