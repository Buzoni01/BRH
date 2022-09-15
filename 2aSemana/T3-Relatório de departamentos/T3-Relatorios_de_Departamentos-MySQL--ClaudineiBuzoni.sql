/* (T3)
Tarefa
Criar um relatório de departamentos.

Descrição
Exclua o schema brh criado anteriormente;
Execute o arquivo mysql_schema.sql anexo neste tarefa;
Execute o arquivo mysql_carga.sql anexo nesta tarefa;
Crie uma consulta que liste a sigla e o nome do departamento;
Ordene o resultado pelo nome.
*/

/***************************************************************************************/
/* EXCLUINDO O SCHEMA brh no MySQL: */

drop schema if exists brh;

/***************************************************************************************/

/***************************************************************************************/
/* CRIANDO UMA CONSULTA, APÓS EXECUTAR OS AQUIVOS mysql_schema.sql e mysql_carga.sql, QUE
   LISTE A sigla E O nome do departamento E ORDENE O RESULTADO PELO nome do departamento:
*/   
   
SELECT sigla as "Sigla", nome as "Departamento" 
FROM departamento
ORDER BY nome;
/***************************************************************************************/

