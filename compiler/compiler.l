%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include "compiler.tab.h"
#define SAVE yylval.string = ( char * ) strdup( yytext )


%}

%x comment

%%

[ \t\n]		{}

"{" 			BEGIN(comment);
<comment>[^}] 	;
<comment>"}"	BEGIN(INITIAL);


"+"				{ return PLUS; 		}
"-" 			{ return MINUS;		}
"/"				{ return DIV;		}
"*"				{ return MULT;		}
"%"				{ return MOD; 		}

"="				{ return EQ; 		}
"<>"			{ return UNEQ; 		}
">="			{ return MOREEQ;	}
"<="			{ return LESSEQ;	}
">"				{ return MORE; 		}
"<"				{ return LESS; 		}

":="			{ return ASG; 		}

"["				{ return OPN; 		}
"]"				{ return CLS; 		}

VAR				{ return VAR;		}
BEGIN			{ return BEG;		}
END				{ return END;		}

FOR				{ return FOR;		}
ENDFOR			{ return ENDFOR;	}
DO 				{ return DO;		}
TO				{ return TO;		}
DOWNOTO			{ return DOWNTO; 	}
FROM			{ return FROM;		}

WHILE			{ return WHILE; 	}
ENDWHILE		{ return ENDWHILE; 	}

IF				{ return IF;		}
THEN			{ return THEN; 		}
ELSE			{ return ELSE;		}
ENDIF			{ return ENDIF; 	}

SKIP			{ return SKIP;		}

WRITE			{ return WRITE;		}
READ			{ return READ;		}


[0-9]+			{ yylval.data.string = ( char * ) strdup( yytext ); return NUM;	}
[_a-z]+			{ yylval.data.string = ( char * ) strdup( yytext ); return ID; 	}

";"				{ return SEM; 	}

.				;
%%