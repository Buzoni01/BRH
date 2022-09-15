/* 6. Validar cálculo de idade
Tarefa
Altere a função brh.calcula_idade para não permitir datas inválidas.

Critérios de aceitação
A data recebida por parâmetro deve ser menor que a data atual::
Se maior, ou null, lance uma exceção com a mensagem "Impossível calcular idade! Data inválida: <DATA_RECEBIDA_POR_PARÂMETRO>.".
Atividade
*/
CREATE OR REPLACE FUNCTION brh.calcula_idade(
f_NASCI IN DATE
)
RETURN NUMBER
IS  
  v_IDADE NUMBER;
  v_NASCI DATE;
BEGIN
    v_NASCI := f_NASCI;
    IF v_NASCI > SYSDATE OR v_NASCI = NULL THEN
       dbms_output.put_line('Impossível calcular idade! Data inválida: ' || v_NASCI);
    ELSE
       v_IDADE := TRUNC((MONTHS_BETWEEN(SYSDATE, v_NASCI)/12));
       dbms_output.put_line('Sua idade é: ' || v_IDADE || ' ANOS.' );
    END IF;
    RETURN v_IDADE;
END;

DECLARE
    v_NASCI DATE := TO_DATE('23-09-2028','DD-MM-YYYY');
    v_IDADE NUMBER :=0;
BEGIN
    v_IDADE := brh.calcula_idade(v_NASCI);
END;
