/* T12-Listar colaboradores que participaram de todos os projetos*/

/*
Tarefa
Crie um relatório que informe os colaboradores que participaram de todos os projetos.

OBS.: Pense que novos projetos podem ser cadastrados, então a consulta não deve ser fixada somente aos projetos atuais, mas ser flexível para projetos futuros.

Dica: essa é a implementação do operador Division da álgebra relacional no SQL. Infelizmente, os bancos não possuem tal operador. Mas a forma mais simples de 
implementar essa consulta pode ser vista neste post: Relational Division in SQL The Easy Way.

*/

SELECT atrb.colaborador, COUNT(atrb.projeto) AS Projeto
from BRH.atribuicao atrb
GROUP BY atrb.colaborador
HAVING COUNT(atrb.projeto) = (SELECT COUNT(*) FROM BRH.projeto);

