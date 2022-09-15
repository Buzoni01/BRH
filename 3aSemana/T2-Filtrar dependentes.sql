/*(T2)
Tarefa
Criar uma consulta que liste os dependentes que nasceram em abril, maio ou junho, ou tenha a letra "h" no nome.

Crit�rios de aceita��o
Ordene primeiramente pelo nome do colaborador, depois pelo nome do dependente.
*/

SELECT colab.nome Colaborador, depen.nome Dependente, to_char(depen.data_nascimento,'DD/MM/YYYY') "Data de Nascimento" 
  FROM BRH.dependente depen, BRH.colaborador colab
 WHERE depen.colaborador = colab.matricula AND (to_char(depen.data_nascimento, 'MM') = '04' OR to_char(depen.data_nascimento, 'MM') = '05' OR 
                                                to_char(depen.data_nascimento, 'MM') = '06' OR lower(depen.nome) LIKE '%h%')
ORDER BY colab.nome, depen.nome;    

