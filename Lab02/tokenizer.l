%{
    
#include<stdio.h>
#include<string.h>

int line_no =1;
%}

DIGIT [0-9]
ID [a-zA-Z_][a-zA-Z0-9_]*
KEYWORD (if|else|while|for|return|int|float|void)
OP ==|!=|<=|>=|\+|\-|\*|\/|>|<|=
SEPARATOR [;,(){}]

%%
{KEYWORD} { printf("KEYWORD: %s\n", yytext); }
{ID} { printf("IDENTIFIER: %s\n", yytext); }
{DIGIT} { printf("DIGIT: %s\n", yytext); }
{OP} { printf("OPERATOR: %s\n", yytext); }
{SEPARATOR} { printf("SEPARATOR: %s\n", yytext); }

\n  { line_no++; }


[ \t]   ;

.  { printf("UNKNOWN: %s\n", yytext); }

%%
int main(){
    printf("Enter the source code (Ctrl + D to end input):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}