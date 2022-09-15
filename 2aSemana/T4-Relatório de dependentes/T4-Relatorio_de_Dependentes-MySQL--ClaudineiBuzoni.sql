/*(T4)
Crie uma consulta que liste:
nome do colaborador;
nome do dependente;
data de nascimento do dependente;
parentesco do dependente.
Ordene o resultado pelo nome do colaborador e pelo nome do dependente.*/

/***************************************************************************************/
/* CRIANDO A CONSULTA: */

SELECT colaborador.nome as "Colaborador", dependente.nome as "Dependente", dependente.data_nascimento as "Data de Nascimento", dependente.parentesco as "Parentesco"
FROM colaborador, dependente
WHERE colaborador.matricula = dependente.colaborador
ORDER BY colaborador.nome, dependente.nome;

/***************************************************************************************/
