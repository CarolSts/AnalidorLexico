package analisadorlexico;
import static analisadorlexico.Tokens.*;
%%
%class Analise
%type Tokens
Letras=[a-zA-Z_]+
Digitos=[0-9]+
espaco=[ ,\t,\r,\n]+
%{
    public String lexema;
%}
%%
abstract | assert | boolean | break| byte| case| catch| char| class |
continue | default do| double| else| enum | extends | false | final |
finally | float | for | if | implements | import | instanceof | int |
interface | long | native | new | null | package | private | protected |
public | return | short | static | strictfp | super | switch | synchronized |
this | throw | throws | transient | true | try | void | volatile |
while {lexema=yytext(); return Reservada;}

{espaco} {/*Ignore*/}
"//".* {/*Ignore*/}
"{" | "}" | "(" | ")" | ";" {return Delimitador;}
"=" | "+" | "-" | "*" | "/" | "=" | ">" | "<" {return Operador;}
"&&" | "|" | "| |" {return Booleano;} 
{Letras}({Letras}|{Digitos})* {lexema=yytext(); return Identificador;}
("(-"{Digitos}+")")|{Digitos}+ {lexema=yytext(); return Numero;}
 . {return Erro;}

