/******************************************************************************************************************************/
/* 7. Criar define_atribuicao
Tarefa
Criar a procedure brh.define_atribuicao para inserir um colaborador num projeto em um determinado papel.

Parâmetros da procedure
Nome do colaborador: varchar com o nome do colaborador a ser designado;
Nome do projeto: varchar com nome do projeto que o colaborador atuará;
Nome do papel: varchar com nome do papel a ser exercido pelo colaborador.
Critérios de aceitação
Se o colaborador não existir, lançar exceção com a mensagem _"Colaborador inexistente: <NOME_DO_COLABORADOR_RECEBIDO>.";
Se o projeto não existir, lançar exceção com a mensagem _"Projeto inexistente: <NOME_DO_PROJETO_RECEBIDO>.";
Se o papel não existir, cadastrar novo papel com o nome recebido e utilizá-lo na atribuição;
Crie a procedure na package brh.pkg_projeto, caso tenha feito a tarefa anterior.
*/

create or replace PROCEDURE brh.define_atribuicao(
    p_NOMCOLAB IN BRH.colaborador.nome%type,
    p_NOMPROJE IN BRH.projeto.nome%type,
    p_NOMPAPEL IN BRH.papel.nome%type)    
IS
    CURSOR cur_COLAB_ID IS SELECT matricula, nome FROM BRH.colaborador;
    CURSOR cur_PROJE_ID IS SELECT id, nome FROM BRH.projeto;    
    CURSOR cur_PAPEL_ID IS SELECT id, nome FROM BRH.papel ORDER BY id; 
    v_COLAB_ID BRH.colaborador.matricula%type := 'NAO';
    v_PROJE_ID BRH.projeto.id%type := -1;
    v_PAPEL_ID BRH.papel.id%type := -1; 
BEGIN
   FOR rec_colab IN cur_COLAB_ID LOOP
       IF rec_colab.nome = p_NOMCOLAB THEN
          v_COLAB_ID := rec_colab.matricula;
       END IF;   
   END LOOP;
   IF v_COLAB_ID = 'NAO' THEN   
      RAISE_APPLICATION_ERROR(-20050, 'Colaborador inexistente: ' || p_NOMCOLAB);
   ELSE
      FOR rec_proje IN cur_PROJE_ID LOOP
          IF rec_proje.nome = p_NOMPROJE THEN
             v_PROJE_ID := rec_proje.id;
          END IF;   
      END LOOP;
      IF v_PROJE_ID = -1 THEN
         RAISE_APPLICATION_ERROR(-20050, 'Colaborador inexistente: ' || p_NOMCOLAB);
      ELSE
         FOR rec_papel IN cur_PAPEL_ID LOOP
             IF rec_papel.nome = p_NOMPAPEL THEN
                v_PAPEL_ID := rec_papel.id;
             END IF;   
         END LOOP;
         IF v_PAPEL_ID = -1 THEN  
            INSERT INTO BRH.papel (NOME) VALUES (p_NOMPAPEL) RETURNING id INTO v_PAPEL_ID;         
         END IF;
         INSERT INTO BRH.atribuicao (COLABORADOR, PROJETO, PAPEL) VALUES (v_COLAB_ID, v_PROJE_ID, v_PAPEL_ID);         
      END IF;
   END IF;
END;

DECLARE
    v_NOMCOLAB BRH.colaborador.nome%type := 'Bia';
    v_NOMPROJE BRH.projeto.nome%type     := 'Oracle Exadata';
    v_NOMPAPEL BRH.papel.nome%type       := 'Developer Java2';
BEGIN
    brh.define_atribuicao(p_NOMCOLAB => v_NOMCOLAB, p_NOMPROJE => v_NOMPROJE, p_NOMPAPEL => v_NOMPAPEL);
    COMMIT;
END;
