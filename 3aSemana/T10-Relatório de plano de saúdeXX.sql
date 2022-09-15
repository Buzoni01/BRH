/*
Tarefa
O usuário quer saber quanto é a mensalidade que cada colaborador deve pagar ao plano de saúde. As regras de pagamento são:

Cada nível de senioridade tem um percentual de contribuição diferente:
Júnior paga 1% do salário;
Pleno paga 2% do salário;
Sênior paga 3% do salário;
Corpo diretor paga 5% do salário.
Cada tipo de dependente tem um valor adicional diferente:
Cônjuge acrescenta R$ 100,00 na mensalidade;
Maior de idade acrescenta R$ 50,00 na mensalidade;
Menor de idade acrescenta R$ 25,00 na mensalidade.
O valor a ser pago é a soma do percentual definido pela senioridade mais o valor de cada dependente do colaborador.

Regras de aceitação
Ordene pelo nome do colaborador.
*/









CREATE VIEW VW_PORCENT_SALARIO AS 
SELECT colab.matricula Matricula, colab.nome Colaborador, colab.salario Salario, 
 (CASE WHEN colab.salario <= 3000 THEN 'Junior'
       WHEN colab.salario > 3000 AND coLab.salario <=  6000 THEN 'Pleno'
       WHEN colab.salario > 6000 AND colab.salario <= 20000 THEN 'Senior'
  ELSE 'Corpo Diretor'
  END) AS SENIORIDADE,
 (CASE WHEN colab.salario <= 3000 THEN salario * 0.01
       WHEN colab.salario > 3000 AND colab.salario <=  6000 THEN colab.salario * 0.02
       WHEN colab.salario > 6000 AND colab.salario <= 20000 THEN colab.salario * 0.03
  ELSE colab.salario * 0.05
  END) AS CONVENIO  
FROM BRH.colaborador colab
ORDER BY SENIORIDADE, colab.nome;

CREATE VIEW VW_TAXA_CONVENIO AS
SELECT dpdt.cpf CPF, dpdt.nome Dependente, to_char(dpdt.data_nascimento,'DD/MM/YYYY') "Data Nasc.", dpdt.parentesco Parentesco,
       nvl(floor((sysdate - dpdt.data_nascimento) /365),0) Idade,
       (CASE WHEN (sysdate - dpdt.data_nascimento)/365 < 18 
       THEN 'Menor de Idade' 
       ELSE 'Maior de Idade' 
       END) "Faixa Etaria", 
       colab.matricula "Matricula do Colaborador",
       (CASE WHEN dpdt.parentesco = 'Conjuge'  THEN (100*1)
             WHEN (sysdate - dpdt.data_nascimento)/365 < 18 THEN (25*1)
       ELSE (50*1) 
       END) "Taxa Convenio",
       dpdt.colaborador Matri2
FROM BRH.colaborador colab
INNER JOIN BRH.dependente dpdt
        ON dpdt.colaborador = colab.matricula
GROUP BY CPF;        
ORDER BY colab.matricula, dpdt.nome;


SELECT DISTINCT Matricula
, Colaborador
, Salario
, SENIORIDADE
, CONVENIO
, Dependente
, Parentesco
, "Taxa Convenio"
, Matri2

FROM VW_TAXA_CONVENIO
INNER JOIN VW_PORCENT_SALARIO
ON Matricula = Matri2
ORDER BY Matricula; --= Colaborador; --= Matricula;


SELECT Matricula
, Colaborador
, Salario
, SENIORIDADE
, CONVENIO
, Dependente
, Parentesco
, SUM("Taxa Convenio")

FROM VW_TAXA_CONVENIO
INNER JOIN VW_PORCENT_SALARIO
ON Matricula = Matri2
GROUP BY Matricula;



SELECT * FROM BRH.COLABORADOR;
select * from BRH.dependente;
***



*************Cicero
SELECT plano.colab AS colaborador,
        SUM(plano.valor_dependente) + plano.valor_senioridade AS valor_total
FROM
    (SELECT colab.nome as colab,
    (CASE
        WHEN dpt.parentesco = 'CÃ´njuge' THEN 100
        WHEN  NVL(Floor(Months_Between(SYSDATE,dpt.data_nascimento)/12),0) >= 18 THEN 50
        ELSE 25
    END) AS valor_dependente,
    (CASE
        WHEN colab.salario <= 3000 THEN salario * 0.01
        WHEN colab.salario <= 6000 THEN salario * 0.02
        WHEN colab.salario <= 20000 THEN salario * 0.03
        ELSE salario * 0.05
    END) AS valor_senioridade 
FROM brh.colaborador colab
INNER JOIN brh.dependente dpt
ON colab.matricula = dpt.colaborador) plano
GROUP BY plano.colab, plano.valor_senioridade
ORDER BY plano.colab;





**********

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

SELECT colab.nome AS COLABORADOR, COUNT(*) AS "QTD. DEPENDENTES"
FROM BRH.colaborador colab
INNER JOIN BRH.dependente dpdt
    ON dpdt.colaborador = colab.matricula
GROUP BY colab.nome
HAVING COUNT(*) > 1
ORDER BY "QTD. DEPENDENTES" DESC, colab.nome;





