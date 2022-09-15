/* T11
Descrição
Editar
Tarefa
O usuário quer paginar a listagem de colaboradores em páginas de 10 registros cada. Há 26 colaboradores na base, então há 3 páginas:

Página 1: da Ana ao João (registros 1 ao 10);
Página 2: da Kelly à Tati (registros 11 ao 20); e
Página 3: do Uri ao Zico (registros 21 ao 26).
Crie uma consulta que liste a segunda página.

OBS.: pense que novos registros podem ser inclusos à tabela; logo, a consulta não deve levar em consideração matrícula, etc.

Critérios de aceitação
Ordene pelo nome do colaborador.
*/


SELECT * FROM (
SELECT ROWNUM AS Numero, colab.nome as Nome FROM BRH.colaborador colab
) X
WHERE Numero <= 10 
ORDER BY Nome;

SELECT * FROM (
SELECT ROWNUM AS Numero, colab.nome as Nome FROM BRH.colaborador colab
) X
WHERE Numero > 10 AND Numero <= 20
ORDER BY Nome;

SELECT * FROM (
SELECT ROWNUM AS Numero, colab.nome as Nome FROM BRH.colaborador colab
) X
WHERE Numero > 20 AND Numero <= 30
ORDER BY Nome;