compiler:
	bison -d compiler.y
	flex compiler.l
	gcc -g -o program lex.yy.c compiler.tab.c 

clean:
	rm -f bison.tab.c bison.tab.h lex.yy.c program
	
interpreter:
	g++ -o interpreter interpreter.cc