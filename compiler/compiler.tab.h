/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUM = 258,
     ID = 259,
     WHILE = 260,
     DO = 261,
     ENDWHILE = 262,
     FOR = 263,
     FROM = 264,
     TO = 265,
     DOWNTO = 266,
     ENDFOR = 267,
     VAR = 268,
     BEG = 269,
     END = 270,
     WRITE = 271,
     READ = 272,
     IF = 273,
     THEN = 274,
     ELSE = 275,
     ENDIF = 276,
     SKIP = 277,
     PLUS = 278,
     MINUS = 279,
     DIV = 280,
     MULT = 281,
     MOD = 282,
     EQ = 283,
     UNEQ = 284,
     MOREEQ = 285,
     LESSEQ = 286,
     MORE = 287,
     LESS = 288,
     ASG = 289,
     OPN = 290,
     CLS = 291,
     SEM = 292
   };
#endif
/* Tokens.  */
#define NUM 258
#define ID 259
#define WHILE 260
#define DO 261
#define ENDWHILE 262
#define FOR 263
#define FROM 264
#define TO 265
#define DOWNTO 266
#define ENDFOR 267
#define VAR 268
#define BEG 269
#define END 270
#define WRITE 271
#define READ 272
#define IF 273
#define THEN 274
#define ELSE 275
#define ENDIF 276
#define SKIP 277
#define PLUS 278
#define MINUS 279
#define DIV 280
#define MULT 281
#define MOD 282
#define EQ 283
#define UNEQ 284
#define MOREEQ 285
#define LESSEQ 286
#define MORE 287
#define LESS 288
#define ASG 289
#define OPN 290
#define CLS 291
#define SEM 292




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 51 "compiler.y"
{
	struct{
		char * string;
		int num;
		int type;
	}  data;
}
/* Line 1529 of yacc.c.  */
#line 131 "compiler.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

