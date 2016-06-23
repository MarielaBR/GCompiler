/* --------------------Seccion de codigo de usuario---------------------- */
package analizador;

import java.util.ArrayList;
import java_cup.runtime.*;

%% //inicio de opciones

/* ----------Seccion de opciones y declaraciones de JFlex----------- */

//Cambiamos el nombre de la clase del analizador
%class AnalizadorLexico
//Cambiamos el nombre la funcion para el siguiente token por nextToken
%function next_token
//Clase publica
%public
//Cuando se alcanza el fin del archivo de entrada
%eof{
    //System.out.println("Fin del archivo de codigo");
%eof}
//Activar el contador de lineas, variable yyline
%line
//Activar el contador de columna, variable yycolumn
%column
/*Activamos la compatibilidad con Java CUP para analizadores sintáctics (parser)*/
%type java_cup.runtime.Symbol
%cup

%init{
TablaSimbolos= new ArrayList<entradaTS>();
ManejadorDeErrores= new ArrayList<Error1>();
contador=0;
%init}


/*Declaraciones:
El código entre %{ y %} será copiado íntegramente en el analizador generado*/
%{
public String lexema;
int contador;
ArrayList<entradaTS> TablaSimbolos;
ArrayList<Error1> ManejadorDeErrores;

    /* Generamos un java_cup.Symbol para guardar el tipo de token encontrado*/
    private Symbol symbol(int type){
        return new Symbol(type,yyline,yycolumn);
    }
    
    /* Generamos un Symbol para el tipo de token encontrado junto con su valor*/
    private Symbol symbol(int type,Object value){
        return new Symbol(type,yyline,yycolumn,value);
    }
%}  

//Fin de opciones


/*Macro declaraciones:
Declaramos expresiones regulares que después usaremos en las reglas léxicas */
//Expresiones regulares
//Declaraciones
LET=[A-Z]
DIG=[0-9]
ALPHANUMERIC={LET}|{DIG}
NUM=({DIG})+
ID={LET}({ALPHANUMERIC})*
IGNORE=[ \t\r\n]
BLANK=[ ]
COMENTARIOS= "/*"~"*/"
COMENT="--"({ALPHANUMERIC}|{BLANK})+|"--"
COMENTS="--"([¨*+"[""]"{}'´·!-&¡Ñ\¿?"<"">"¡#$%&/()=°¬"|"\^]|[0-9]|Ä|Ë|Ï|Ö|Ü|[A-Z]|Á|É|Í|Ó|Ú|Ý|{BLANK})+
COMENTSS="-"([¨*+"[""]"{}'´·!-&¡Ñ\¿?"<"">"¡#$%&/()=°¬"|"\^]|[0-9]|Ä|Ë|Ï|Ö|Ü|[A-Z]|Á|É|Í|Ó|Ú|Ý|{BLANK})+
INVALIDO=[([¨*+"[""]"{}'´·!-&¡Ñ\¿?"<"">"¡#$%&/()=°¬"|"\^]|[0-9]|Ä|Ë|Ï|Ö|Ü|[A-Z]|Á|É|Í|Ó|Ú|Ý|)]+
STRING=("\"" ({LET}|{NUM}|{BLANK})* "\"")
NOACEPTADOS=[·!-&¡0-9Ññ/\“\”ÁÉÍÓÚÝÄËÏÖÜ]
NO={NUM}{ID}
//fin declaraciones



/* Seccion de reglas lexicas */
%% 
//Regla     {Acciones}

<YYINITIAL>{
"INT"   {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.INT_WORD);}

"BOOLEAN" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.BOOLEAN_WORD);}

"STRING" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.STRING_WORD);}

"ABSTRACTION" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.ABSTRACTION);}

"AFFABILITY" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.AFFABILITY);}

"APPREHENSION" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.APPREHESION);}

"ANXIETY" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.ANXIETY);}

"CARETOSTANDARDS" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.CARETOSTANDARDS);}

"DARE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.DARE);}

"DOMINANCE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.DOMINANCE);}

"HARDNESS" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.HARDNESS);}

"INDEPENDENCE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.INDEPENDENCE);}

"LIVELINESS" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.LIVELINESS);}

"OPENNESSTOCHANGE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.OPENNESSTOCHANGE);}

"PERFECTIONISM" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.PERFECTIONISM);}

"PRIVACY" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.PRIVACY);}

"REASONING" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.REASONING);}

"SELFCONTROL" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.SELFCONTROL);}

"SELFSUFFICIENCY" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.SELFSUFFICIENCY);}

"SENSITIVITY" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.SENSITIVITY);}

"SOCIABILITY" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.SOCIABILITY);}

"STABILITY" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.STABILITY);}

"STRESS" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.STRESS);}

"SURVEILLANCE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.SURVEILLANCE);}

"ARRAYSTRING" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.ARRAYSTRING);}

"FEATURES" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.FEATURES);}

"GROUP" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.GROUP);}

"NODE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.NODE);}

"READFEATVAL" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.READFEATVAL);}

"READSTRING" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.READSTRING);}

"GENERATEGROUP" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.GENERATEGROUP);}

"PRINTGRAPH" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.PRINTGRAPH);}

"PRINTLN" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.PRINTLN);}

"IF" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.IF);}

"ELSE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.ELSE);}

"LOOP" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.LOOP);}

"FALSE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.FALSE);}

"TRUE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.TRUE);}

"BUILD" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.BUILD);}

"DECLARE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.DECLARE);}

"GETFEATURES" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.GETFEATURES);}

"GETSIMILITUDE" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.GETSIMILITUDE);}

"MAIN" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.MAIN);}

"MAX" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.MAX);}

"MIN" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.MIN);}

"NEW" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.NEW);}

"NOT" {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.NOT);}

{COMENTARIOS} {/*IGNORE*/}

{COMENTS} {/*IGNORE*/}

{COMENTSS} {/*IGNORE*/}

{COMENT} {/*IGNORE*/}

{STRING} {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.STRING);}

{IGNORE} {/*IGNORE*/}

{ID}   {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.ID);}

{NUM}    {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.NUM);}

("==")  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.EQUAL_OP);}

("(") {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.PARENTH1);}

(")") {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.PARENTH2);}

("{") {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.CURLY_BR1);}

("}") {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.CURLY_BR2);}

\[ {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.BRACKET1);}

\] {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.BRACKET2);}

(">=")  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.GREATER_EQUAL_OP);}

("<=")  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.LESS_EQUAL_OP);}

("!=")  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.NOT_EQUAL_OP);}

("&&")  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.AND_OP);}

("|")  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.OR_OP);}

">"  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.GREATER_OP);}

"<"  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.LESS_OP);}

"="  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.ASSIG_OP);}

"+"  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.ADD_OP);}

"-"  {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.SUBS_OP);}

(";") {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.SEMICOLON_SIGN);}

(".") {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.POINT_SIGN);}

(",") {
TablaSimbolos.add(new entradaTS(yyline, yycolumn, contador++, yytext())); 
return symbol(sym.COMMA_SIGN);}

(({LET}* {NOACEPTADOS}+ {LET}* {NOACEPTADOS}*)+)  {
ManejadorDeErrores.add(new Error1("Lexico",yyline,yycolumn,yytext()));
return symbol(sym.ERRORLEX);}

{NO} {
ManejadorDeErrores.add(new Error1("Lexico",yyline,yycolumn,yytext())); 
return symbol(sym.ERRORLEX);}

[^] {
ManejadorDeErrores.add(new Error1("Lexico",yyline,yycolumn,yytext()));
return symbol(sym.ERRORLEX);}
}