/* 1-Criar procedure insere_projeto */
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
/******************************************************************************************************************************/
/* 2. Criar função calcula_idade */

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
/******************************************************************************************************************************
* 3. è Essa tarefa (Geral este aquivo, com todos os comandos utilizados durante o Treinamento.)
Tarefa
Publicar seus comandos executados.

Passos:
Crie o arquivo programa.sql com os comandos utilizados nas tarefas;
Crie uma pasta com o seu nome no Drive semana 4 - Google Drive;
Suba o arquivo para a sua pasta.*/
/******************************************************************************************************************************/
/* 4. Criar function finaliza_projeto */
CREATE OR REPLACE FUNCTION brh.finaliza_projeto(
f_ID  IN BRH.projeto.id%type,
f_FIM IN BRH.projeto.fim%type    
)
RETURN BRH.projeto.fim%type
IS
v_FIM BRH.projeto.fim%type;
BEGIN
    v_FIM := f_FIM;
    UPDATE BRH.projeto 
       SET FIM = v_FIM 
     WHERE id = f_ID;
    IF SQL%NOTFOUND THEN 
       raise_application_error(-20010, 'Não existe Projetos para Finalizar.');
    ELSE
       dbms_output.put_line('Projeto : ' || f_ID || ', Finalizado em: ' || v_FIM);
    END IF;
    RETURN v_FIM;
END;

DECLARE
    v_ID BRH.projeto.Id%type   := 145;
    v_FIM BRH.projeto.fim%type := SYSDATE;   
BEGIN
    v_FIM := brh.finaliza_projeto(f_ID => v_ID, f_FIM => v_FIM);
    COMMIT;
END;
/******************************************************************************************************************************/
/* 5. Validar novo projeto */
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
/******************************************************************************************************************************/
/* 6. Validar cálculo de idade */
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
/******************************************************************************************************************************/
/* 7. Criar define_atribuicao */
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





