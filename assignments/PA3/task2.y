%{
#include <stdio.h>
void yyerror(const char* str){
    fprintf (stderr, "%s/n", s);
};
%}
%union {
	double floatval;
}
%token T_FALSE T_TRUE

%left '+' '-'
%left '*' '/'
%right uminus

%%
S   :   S E '\n'        { printf("ans = %d\n", $2); }
    |   /* empty */     { /* empty */ }
    ;

E   :   E '&&' E         { $$ = $1 + $3; }
    |   E '||' E         { $$ = $1 or $3; }
    |   '(' E ')'       { $$ = $2; }
    ;

%%
int main() {
    return yyparse();
}
