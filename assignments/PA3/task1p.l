%{
/*
 * 识别整数 加减乘除 括号
 */
#include "task1.tab.h"
%}

%%

[0-9]+\.[0-9]*  { yylval = atoi(yytext); return T_NUM; }

%%

int yywrap(){
    return 1;
}