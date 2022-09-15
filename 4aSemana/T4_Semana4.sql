/* 4. Criar function finaliza_projeto
Tarefa
Crie a function brh.finaliza_projeto para registrar o término da execução de um projeto.

Parâmetros da function
ID do projeto: number com identificador do projeto a ser finalizado.
Retorno da function
Deve retornar a data de finalização atribuída ao projeto.
Critérios de aceitação
A data fim do projeto para a data e hora atual;
Não deve fazer commit em seu código (a efetivação da transação deve ser feita por quem invoca a function).
*/
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