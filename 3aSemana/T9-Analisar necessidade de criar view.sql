/* T(8)- Analisar necessidade de criar view:
Tarefa
Agora, assuma o papel de arquiteto e veja se há alguma consulta que poderia virar view e facilitar os relatórios.

Tente recriar os relatórios usando as views que criou. ?
*/


/* VIEW: T7-Listar faixa etária dos dependentes */
SELECT CPF, Dependente, "Data Nasc.", Idade, "Faixa Etária" FROM VW_FETARIA_DEPEND;
/******************************************************************************************************************************/
/* VIEW: T6-Listar colaboradores com mais dependentes */
SELECT COLABORADOR, "QTD. DEPENDENTES" FROM VW_MAIS_DEPENDENTES;
/******************************************************************************************************************************/
/* VIEW: T5-Listar colaboradores em projetos */
SELECT DEPARTAMENTO, PROJETO, "QTD. DE COLABORADORES" FROM VW_COLAB_PROJETOS;
/******************************************************************************************************************************/
/* VIEW: T3-Listar colaborador com maior salário */
SELECT Colaborador, Salário FROM VW_MAIOR_SALARIO;
/******************************************************************************************************************************/
/* NÃO foi criado as VIEWS para T2-Filtrar dependentes e T4-Relatório de senioridade, pois eles possuem HARD CODE, valores fixos */
/* em seus códigos e esses valores e critérios podem variar.
/******************************************************************************************************************************/

/******************************************************************************************************************************/
/* CRIANDO A VIEW: T7-Listar faixa etária dos dependentes */
CREATE VIEW VW_FETARIA_DEPEND AS 
SELECT dpdt.cpf CPF, dpdt.nome Dependente, to_char(dpdt.data_nascimento,'DD/MM/YYYY') "Data Nasc.", dpdt.parentesco,
       nvl(floor((sysdate - dpdt.data_nascimento) /365),0) Idade,
      (CASE WHEN (sysdate - dpdt.data_nascimento)/365 < 18 
       THEN ' Menor de Idade ' 
       ELSE ' Maior de Idade ' 
       END) "Faixa Etária", 
       colab.matricula "Matricula do Colaborador"
FROM BRH.colaborador colab
INNER JOIN BRH.dependente dpdt
        ON dpdt.colaborador = colab.matricula
ORDER BY colab.matricula, dpdt.nome;
/******************************************************************************************************************************/
/* CRIANDO A VIEW: T6-Listar colaboradores com mais dependentes */
CREATE VIEW VW_MAIS_DEPENDENTES AS 
SELECT colab.nome AS COLABORADOR, COUNT(*) AS "QTD. DEPENDENTES"
FROM BRH.colaborador colab
INNER JOIN BRH.dependente dpdt
    ON dpdt.colaborador = colab.matricula
GROUP BY colab.nome
HAVING COUNT(*) > 1
ORDER BY "QTD. DEPENDENTES" DESC, colab.nome;
/******************************************************************************************************************************/
/* CRIANDO A VIEW: T5-Listar colaboradores em projetos */
CREATE VIEW VW_COLAB_PROJETOS AS 
SELECT dpto.nome AS DEPARTAMENTO, pjto.nome AS PROJETO, COUNT(*) "QTD. DE COLABORADORES"
FROM BRH.departamento dpto
INNER JOIN BRH.colaborador colab
    ON dpto.sigla = colab.departamento 
INNER JOIN BRH.atribuicao atrb
    ON colab.matricula = atrb.colaborador  
INNER JOIN BRH.projeto pjto
    ON atrb.projeto = pjto.id
GROUP BY dpto.nome, pjto.nome     
ORDER BY dpto.nome, pjto.nome;
/******************************************************************************************************************************/
/* CRIANDO A VIEW: T3-Listar colaborador com maior salário */
CREATE VIEW VW_MAIOR_SALARIO AS
SELECT nome Colaborador, salario Salário
FROM BRH.colaborador
WHERE salario = (SELECT MAX(salario) FROM BRH.colaborador);
/******************************************************************************************************************************/







































