/*(T6)
Tarefa
O departamento SECAP não é mais parte da nossa organização, e todos os colaboradores serão 
dispensados (somente para fins didáticos).

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
 