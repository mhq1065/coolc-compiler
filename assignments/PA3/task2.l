%{
/*
 * 识别布尔识别
 */
#include "task2.tab.h"
%}

%%

true  { yylval = atoi(yytext); return T_TRUE; }
false  { yylval = atoi(yytext); return T_FALSE; }

%%

int yywrap(){
    return 1;
}