/*(T3)
Tarefa
Criar consulta que liste nome e o sal�rio do colaborador com o maior sal�rio.

**OBS.: A consulta deve ser flex�vel para continuar funcionando caso surja algum funcion�rio com sal�rio maior que o do Zico.
*/



SELECT nome Colaborador, salario Sal�rio
FROM BRH.colaborador
WHERE salario = (SELECT MAX(salario) FROM BRH.colaborador); 


