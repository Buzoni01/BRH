/*(T7)
Tarefa
Criar consulta que liste o CPF do dependente, o nome do dependente, a data de nascimento (formato brasileiro), parentesco, matrícula do colaborador, a idade do dependente e sua faixa etária.

Regras de aceitação
Se o dependente tiver menos de 18 anos, informar a faixa etária Menor de idade;
Se o dependente tiver 18 anos ou mais, informar faixa etária Maior de idade;
Ordenar consulta por matrícula do colaborador e nome do dependente.
*/


SELECT dpdt.cpf CPF, dpdt.nome Dependente, to_char(dpdt.data_nascimento,'DD/MM/YYYY') "Data Nasc.", dpdt.parentesco,
       nvl(floor((sysdate - dpdt.data_nascimento) /365),0) Idade,
      (CASE WHEN (sysdate - dpdt.data_nascimento)/365 < 18 
       THEN ' Menor de Idade ' 
       ELSE ' Maior de Idade ' 
       END) "Faixa Etária", 
       colab.matricula "Matricula do Colaborador"
FROM BRH.colaborador colab
INNER JOIN BRH.dependente dpdt
        ON dpdt.colaborador = colab.matricula
ORDER BY colab.matricula, dpdt.nome;





