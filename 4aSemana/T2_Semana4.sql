/******************************************************************************************************************************/
/* 2. Criar função calcula_idade
Tarefa
Crie a function brh.calcula_idade que informa a idade a partir de uma data.

Parâmetros da function
Data: date com a data de referência para calcular a idade.
Retorno da function
Deve retornar um número inteiro com a idade.
Dica
Utilize a função MONTHS_BETWEEN para calcular a idade.
É mais fácil testar funções com o seguinte código: select SCHEMA.FUNCAO(param1, param2, ..., paramN) from dual;.
Atividade
*/

CREATE OR REPLACE FUNCTION brh.calcula_idade (
f_NASCI IN DATE
)
RETURN NUMBER
IS  
  f_IDADE NUMBER;
BEGIN
    f_IDADE := TRUNC((MONTHS_BETWEEN(SYSDATE, f_NASCI)/12));
    RETURN f_IDADE;
END;

SET SERVEROUTPUT ON;
DECLARE
   v_NASCI DATE := TO_DATE('23-09-2008','DD-MM-YYYY');
BEGIN
   dbms_output.put_line('Sua idade é: ' || brh.calcula_idade(v_NASCI) || ' ANOS.' );
END;