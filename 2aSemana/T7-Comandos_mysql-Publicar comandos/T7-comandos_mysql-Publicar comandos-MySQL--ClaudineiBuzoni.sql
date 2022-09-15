/*
Tarefa
Publicar seus comandos executados.

Passos:
Crie o arquivo comandos_mysql.sql com os comandos utilizados nas tarefas Relatório de departamentos, 
Relatório de dependentes, Inserir novo colaborador em projeto e Excluir departamento SECAP;
Suba o arquivo para a sua pasta no drive 1. 
Publique o arquivo na sua pasta dentro do Drive semana 2 - Google Drive.

*/


/***************************************************************************************/
/* Comandos utilizados na tarefa Relatório de departamentos: */

/* Excluindo o schema brh criado anteriormente:*/
drop schema if exists brh;


/* CRIANDO UMA CONSULTA, APÓS EXECUTAR OS AQUIVOS mysql_schema.sql e mysql_carga.sql, QUE
   LISTE A sigla E O nome do departamento E ORDENE O RESULTADO PELO nome do departamento: */
   
SELECT sigla as "Sigla", nome as "Departamento" 
FROM departamento
ORDER BY nome;   

/***************************************************************************************/



/***************************************************************************************/
/* Comandos utilizados na tarefa Relatório de dependentes: */
/*Crie uma consulta que liste:
  nome do colaborador;
  nome do dependente;
  data de nascimento do dependente;
  parentesco do dependente.
  Ordene o resultado pelo nome do colaborador e pelo nome do dependente.*/

SELECT colaborador.nome as "Colaborador", dependente.nome as "Dependente", dependente.data_nascimento as "Data de Nascimento", dependente.parentesco as "Parentesco"
FROM colaborador, dependente
WHERE colaborador.matricula = dependente.colaborador
ORDER BY colaborador.nome, dependente.nome;

/***************************************************************************************/



/***************************************************************************************/
/* Comandos utilizados para cadastrar o novo colaborador Fulano de Tal no novo projeto BI para exercer
 o papel de Especialista de Negócios.
Observação:
Escolha os valores dos outros campos para o Colaborador;
Escolha os valores dos campos do Projeto;
O colaborador não tem Dependentes;
O colaborador possui o telefone celular (61) 9 9999-9999.
Atenção à ordem em que os registros devem ser inseridos */

INSERT INTO PROJETO VALUES (
 5,
'BI',
'Z123',
'2022-08-05',
'2022-10-25'
);

INSERT INTO PAPEL VALUES (
8,'Especialista de Negocios'
);

INSERT INTO COLABORADOR VALUES (
'A007', '131.574.270-86', 'Fulano de Tal', 'detal@email.com', 'detal@corp.com', '3250.49', 'SEDES', '71222-400', 'Apto.007'
);

INSERT INTO TELEFONE_COLABORADOR VALUES (
'(43)94749-0007','A007', 'M'
);

INSERT INTO ATRIBUICAO VALUES (
'A007', 5, 8
);

/***************************************************************************************/



/***************************************************************************************/
/* Comandos utilizados para executar a tarefa: o departamento SECAP não é mais parte da 
nossa organização, e todos os colaboradores serão dispensados (somente para fins didáticos).

Descrição
Remova o departamento SECAP da base de dados.
Atenção à ordem em que os registros devem ser removidos.
*/


delete from atribuicao 
 where colaborador in ('H123', 'M123', 'R123', 'W123');
  
delete from telefone_colaborador 
 where colaborador in ('H123', 'M123', 'R123', 'W123');
  
delete from dependente
 where colaborador in ('H123', 'M123', 'R123', 'W123');

update departamento 
   set chefe = 'A123'
 where sigla = 'SECAP';
 
delete from colaborador 
 where departamento = 'SECAP';
 
delete from departamento 
 where sigla = 'SECAP';
 
 /***************************************************************************************/