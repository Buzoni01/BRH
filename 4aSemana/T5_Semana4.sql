/******************************************************************************************************************************/
/* 5. Validar novo projeto
Tarefa
Altere a procedure brh.insere_projeto para não permitir cadastrar projetos inválidos.

Critérios de aceitação
O nome do novo do projeto deve ter duas ou mais letras:
Se tiver menos caracteres, ou for null, lance uma exceção com a mensagem "Nome de projeto inválido! Deve ter dois ou mais caracteres.".
Dicas
Use a função LENGTH para descobrir o tamanho do texto.
Atividade
*/
CREATE OR REPLACE PROCEDURE brh.insere_projeto(
p_NOMPROJE IN BRH.projeto.nome%type,
p_NOMRESPO IN BRH.projeto.responsavel%type,
p_INICIO   IN BRH.projeto.inicio%type    
)
IS
BEGIN
  IF LENGTH(p_NOMPROJE) < 2 OR LENGTH(p_NOMPROJE) = NULL THEN
     raise_application_error(-20005, p_NOMPROJE || ' - Nome de projeto inválido! Deve ter dois ou mais caracteres.');
  ELSE
     INSERT INTO BRH.projeto (NOME, RESPONSAVEL, INICIO) VALUES (p_NOMPROJE, p_NOMRESPO, p_INICIO);
     dbms_output.put_line('Projeto: ' || p_NOMPROJE || ' Cadastrado com Sucesso.');
  END IF;    
END;

DECLARE
   v_NOMPROJE BRH.projeto.nome%type := 'P2';   
   v_NOMRESPO BRH.projeto.responsavel%type := 'A123';
   v_INICIO   BRH.projeto.inicio%type := SYSDATE;
BEGIN
    brh.insere_projeto(p_NOMPROJE => v_NOMPROJE, p_NOMRESPO => v_NOMRESPO, p_INICIO => v_INICIO);
    COMMIT;
END;

