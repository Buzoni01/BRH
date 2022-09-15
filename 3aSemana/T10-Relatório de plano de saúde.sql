/* Tarefa
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
CREATE OR REPLACE VIEW BRH.VW_DEPEND AS
SELECT CPF,nome as depend,data_nascimento,parentesco,colaborador, floor((SYSDATE - BRH.DEPENDENTE.DATA_NASCIMENTO)/365.0) AS IDADE,
(CASE WHEN (SYSDATE - BRH.DEPENDENTE.DATA_NASCIMENTO)/365 < 18 THEN 'MenorIdade'
ELSE 'MaiorIdade'
END)AS FaixaEtaria
FROM BRH.DEPENDENTE
ORDER BY COLABORADOR,NOME

SELECT COLABORADOR, SUM(VALOR) AS TOTAL FROM (
SELECT D.COLABORADOR,100 AS VALOR
FROM BRH.VW_DEPEND D
WHERE D.PARENTESCO = 'Conjuge'
UNION
SELECT D.COLABORADOR, 50 AS VALOR
FROM BRH.VW_DEPEND D
WHERE D.PARENTESCO = 'Filho(a)' AND D.FAIXAETARIA = 'MaiorIdade'
UNION ALL
SELECT D.COLABORADOR, 25 AS VALOR
FROM BRH.VW_DEPEND D
WHERE D.PARENTESCO = 'Filho(a)' AND D.FAIXAETARIA = 'MenorIdade'
UNION ALL
SELECT COLAB.MATRICULA,
CASE
WHEN COLAB.SALARIO <3000 THEN COLAB.SALARIO * 0.01
WHEN COLAB.SALARIO <=6000 THEN COLAB.SALARIO * 0.02
WHEN COLAB.SALARIO <=20000 THEN COLAB.SALARIO * 0.03
ELSE COLAB.SALARIO * 0.05
END  
AS VALOR
FROM BRH.COLABORADOR COLAB
)
GROUP BY COLABORADOR
ORDER BY COLABORADOR
