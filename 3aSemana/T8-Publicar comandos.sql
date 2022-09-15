/* T(8)
Tarefa
Publicar seus comandos executados.

Passos:
Crie o arquivo consultas.sql com os comandos utilizados nas tarefas;
Crie uma pasta com o seu nome no Drive semana 3 - Google Drive;
Suba o arquivo para a sua pasta.
*/
/******************************************************************************************************************************/
/* COMANDOS: T2-Filtrar dependentes */
SELECT colab.nome Colaborador, depen.nome Dependente, to_char(depen.data_nascimento,'DD/MM/YYYY') "Data de Nascimento" 
  FROM BRH.dependente depen, BRH.colaborador colab
 WHERE depen.colaborador = colab.matricula AND (   to_char(depen.data_nascimento, 'MM') = '04' 
                                                OR to_char(depen.data_nascimento, 'MM') = '05' 
                                                OR to_char(depen.data_nascimento, 'MM') = '06' 
                                                OR lower(depen.nome) LIKE '%h%')
ORDER BY colab.nome, depen.nome;    
/******************************************************************************************************************************/



/* COMANDOS: T3-Listar colaborador com maior salário */
SELECT nome Colaborador, salario Salário
FROM BRH.colaborador
WHERE salario = (SELECT MAX(salario) FROM BRH.colaborador);
/******************************************************************************************************************************/



/* COMANDOS: T4-Relatório de senioridade */
SELECT colab.matricula Matricula, colab.nome Colaborador, colab.salario Salário, 
 (CASE WHEN colab.salario <= 3000 THEN 'Júnior'
       WHEN colab.salario > 3000 AND coLab.salario <=  6000 THEN 'Pleno'
       WHEN colab.salario > 6000 AND colab.salario <= 20000 THEN 'Sênior'
  ELSE 'Corpo Diretor'
  END) AS SENIORIDADE
FROM BRH.colaborador colab
ORDER BY SENIORIDADE, colab.nome;
/******************************************************************************************************************************/



/* COMANDOS: T5-Listar colaboradores em projetos */
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



/* COMANDOS: T6-Listar colaboradores com mais dependentes */
SELECT colab.nome AS COLABORADOR, COUNT(*) AS "QTD. DEPENDENTES"
FROM BRH.colaborador colab
INNER JOIN BRH.dependente dpdt
    ON dpdt.colaborador = colab.matricula
GROUP BY colab.nome
HAVING COUNT(*) > 1
ORDER BY "QTD. DEPENDENTES" DESC, colab.nome;
/******************************************************************************************************************************/



/* COMANDOS: T7-Listar faixa etária dos dependentes */
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
/******************************************************************************************************************************




