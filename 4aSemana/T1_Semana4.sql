/* 1-Criar procedure insere_projeto
Tarefa
Crie a procedure brh.insere_projeto para cadastrar um novo projeto na base de dados.

Parâmetros da procedure
Nome do projeto: varchar com nome do novo projeto.
Critérios de aceitação
Deve inserir um novo registro na tabela brh.projeto;
Não deve fazer commit em seu código (a efetivação da transação deve ser feita por quem invoca a procedure).
*/
select * from brh.projeto;
DELETE FROM brh.projeto WHERE id > 4;
commit;
rollback;
CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    p_NOMEPROJ IN BRH.projeto.nome%type,
    p_NOMERESP IN BRH.projeto.responsavel%type,
    p_INICIO IN BRH.projeto.inicio%type    
)
IS
BEGIN
    INSERT INTO BRH.projeto (NOME, RESPONSAVEL, INICIO) VALUES (p_NOMEPROJ, p_NOMERESP, p_INICIO);    
END;

DECLARE
   v_NOMEPROJ BRH.projeto.nome%type := 'Projeto 0075';
   v_NOMERESP BRH.projeto.responsavel%type := 'C123';
   v_INICIO BRH.projeto.inicio%type := SYSDATE;
BEGIN
   brh.insere_projeto(p_NOMEPROJ => v_NOMEPROJ, p_NOMERESP => v_NOMERESP, p_INICIO => v_INICIO);
   COMMIT;
END;

