%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>

	#define ID_NUMBER 10000 
	#define ASM_NUMBER 10000 
	#define REGISTER_NUMBER 5


	void printArrayTable();

	void addId( char * name, int type );
	void addArrayId( char * name, int type, char * num );
	void addCode( char * name, int nrOfArg, int firstArg, int secArg );
	void print( char * string );
	void saveRegister( int _register, char * string );

	int checkVar( char * name );
	int getIdIndex( char * id );
	int stringToNum( char * num );
	int findRegister( );

	typedef struct{
		char * name;
		char * value;
		int mem;
		int type; // 1 - Number, 2 - array
	} identifier;

	typedef struct{
		identifier * tab[ ID_NUMBER ];
		int index;
	} identifiersTable;

	typedef struct{
		char* instr;
		int nrOfArg;
		int args[ 2 ];
	} instruction;

	typedef struct{ 
		instruction* tab[ ASM_NUMBER ];
		int index; 
	} intructionsTable;


    int yylineno;
    int yylex();
    void yyerror(const char *s) { 
    	printf("ERROR: %d\n", yylineno); 
    }

    int memoryIndex;
    int fault;
    int registers[ 5 ];

    identifiersTable idTab;
    intructionsTable asmTab;
%}

%union{
	struct{
		char * string;
		int num;
		int type; // 1 - number ( literal ), 2 - variable
		int _register;
	}  data;
}

%type <data> value

%token <data> NUM
%token <data> ID

%token WHILE
%token DO
%token ENDWHILE

%token FOR
%token FROM
%token TO
%token DOWNTO
%token ENDFOR

%token VAR
%token BEG
%token END

%token WRITE
%token READ

%token IF
%token THEN
%token ELSE
%token ENDIF

%token SKIP

%token PLUS
%token MINUS
%token DIV	
%token MULT
%token MOD

%token EQ
%token UNEQ
%token MOREEQ
%token LESSEQ
%token MORE 
%token LESS

%token ASG

%token OPN
%token CLS

%token SEM


%%

program : VAR vdeclarations BEG commands END
	{
		addCode("HALT", 0, 0 ,0 );
	}

vdeclarations: 
	vdeclarations ID
	{
		if( checkVar( $2.string ) ){
			addId( $2.string, 1 );
		}
	}
	| vdeclarations ID OPN NUM CLS
	{
		if( checkVar( $2.string ) ){
			addArrayId( $2.string, 2, $4.string );
		}
	}
	|

commands : commands command
	| command

command : 
	ID ASG expression
	{

	}
	| IF condition THEN commands ELSE commands ENDIF
	| WHILE condition DO commands ENDWHILE
	| FOR ID FROM value TO value DO commands ENDFOR
	| FOR ID FROM value DOWNTO value DO commands ENDFOR
	| READ ID SEM
	{

	}
	| WRITE value SEM
	{
		if( $2.type == 1 ){
			//printNumber( $2.string );
		}
	}
	| SKIP SEM

expression : value
	| value	PLUS value
	| value MINUS value
	| value MULT value
	| value DIV value
	| value MOD value

condition : value EQ value
	| value UNEQ value
	| value LESS value
	| value MORE value
	| value LESSEQ value
	| value MOREEQ value

value : 
	NUM
	{
		$1.type = 1;
		$1._register = findRegister();
		saveRegister( $1._register, $1.string );
	}
	| identifier
	{
		//$2.type = 1;
	}

identifier : ID
	| ID OPN IF CLS
	| ID OPN NUM CLS
%%




void init(){
 
    idTab.index = 0;
    asmTab.index = 0;
	memoryIndex = 0;
	fault = 0;
	for( int i = 0 ; i < REGISTER_NUMBER ; ++i ){
		registers[ i ] = 0;
	}

}





void addCode( char * name,int nrOfArg, int firstArg, int secArg ){
	
	instruction * newCode = ( instruction * )malloc( sizeof( instruction ) );
	newCode->instr = ( char * )malloc( strlen( name ) );

	strcpy( newCode->instr, name );
	newCode->nrOfArg = nrOfArg;
	newCode->args[ 0 ] = firstArg;
	newCode->args[ 1 ] = secArg;

	asmTab.tab[ asmTab.index ] = newCode;
	asmTab.index++;

}





void print( char * string ){
	
	int num = atoi( string );
	int counter = 0;
	int tab[ 30 ];

	while( num > 0 ){
		tab[ counter++ ] = num % 2;
		num = num / 2;
	}

	addCode( "ZERO", 1, 1, 0 );
	for( int i = 0 ; i < counter ; ++i ){
		if( tab[ 1 ] == 1 ){
			// TU SKOŃCZYŁEM
		}
		else{

		}

		if( i == counter - 1 ){

		}
	}

}





int findRegister( ){
	for( int i = 4 ; i >= 0 ; --i ){
		if( registers[ i ] == 0 )
			return i ;
	}
	return -1;
}





void saveRegister( int _register, char * string ){
	
	registers[ _register ] = 1;
	int num = atoi( string );
	int counter = 0;
	int tab[ 30 ];

	while( num > 0 ){
		tab[ counter++ ] = num % 2;
		num = num / 2;
	}

	addCode( "ZERO", 1, _register, 0 );
	for( int i = 0 ; i < counter ; ++i ){
		if( tab[ i ] == 1 ){
			addCode( "INC", 1, _register, 0 );
		}

		if( i != counter - 1 ){
			addCode( "SHL", 1, _register, 0 );
		}
	}

}




int stringToNum( char * num ){
	return atoi( num );
}





int checkVar( char * name ){
	
	int index = getIdIndex( name);
	if( index > -1 ){
		printf("<line: %d> Error: Nazwa '%s' została już użyta.\n", yylineno, name );
		return 0;
	}
	return 1;

}





void addId( char * name, int type ){
	
	identifier * id = ( identifier * )malloc( sizeof( identifier ) );
	
	id->name = ( char * ) malloc( strlen( name ) );
	strcpy( id->name, name );
	id->type = type;
	id->mem = memoryIndex;

	if( type == 1 ){
		memoryIndex++;
	}
	
	idTab.tab[ idTab.index ] = id;
	idTab.index++;

}





void addArrayId( char * name, int type, char * num ){
	
	addId( name, type );
	memoryIndex += stringToNum( num );

}





int getIdIndex( char * id ){
	
	for( int i = 0 ; i < idTab.index ; ++i ){
		if( strcmp( id, idTab.tab[ i ]->name ) == 0 ){
			return i;
		}
	}	
	return -1;

}




void printInstruction( int i ){
	printf("%s", asmTab.tab[ i ]->instr );
	for( int temp = 0 ; temp < asmTab.tab[ i ]->nrOfArg; ++temp ){
		printf(" %d", asmTab.tab[ i ]->args[ temp ] );
	}
	printf("\n");
}





void parse( int argc, char * argv[] ){

	if( argc == 2 ){
		
		init();
		yyparse();
		if( fault == 0 ){
			for( int i = 0 ; i < asmTab.index ; ++i )
				printInstruction( i );
		}

	}
	else{
		printf("~~~\n");
		printf("Wywołanie programu z nieodpowiednią ilością argumentów.\n");
		printf("~~~\n");
	}

}




void printArrayTable(){

	for( int i = 0 ; i < idTab.index ; ++i ){
		printf("\t%s\n",idTab.tab[ i ]->name);
		printf("\t%d\n",idTab.tab[ i ]->type);
		printf("\t%d\n",idTab.tab[ i ]->mem);
		printf("\n");
	}

}




int main( int argc, char * argv[] ){

	parse( argc, argv );
	return 0;

}























































