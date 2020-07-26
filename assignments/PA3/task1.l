%{
/*
 * 识别整数 加减乘除 括号
 */
#include "task1.tab.h"
%}

%%

[0-9]+          { yylval = atoi(yytext); return T_NUM; }
[-/+*()\n]      { return yytext[0]; }
.               { return 0; /* end when meet everything else */ }

%%

int yywrap(){
    return 1;
}