/*(T6)
Tarefa
Criar consulta que liste nome do colaborador e a quantidade de dependentes que ele possui.

Regras de aceita��o
No relat�rio deve ter somente colaboradores com 2 ou mais dependentes.
Ordenar consulta pela quantidade de dependentes em ordem decrescente, e colaborador crescente.
A sa�da deve ser igual � imagem anexa abaixo
*/

SELECT colab.nome AS COLABORADOR, COUNT(*) AS "QTD. DEPENDENTES"
FROM BRH.colaborador colab
INNER JOIN BRH.dependente dpdt
    ON dpdt.colaborador = colab.matricula
GROUP BY colab.nome
HAVING COUNT(*) > 1
ORDER BY "QTD. DEPENDENTES" DESC, colab.nome;







