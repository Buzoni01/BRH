/*(T4)
Tarefa
Criar uma consulta que liste a matr�cula, nome, sal�rio, e n�vel de senioridade do colaborador. 

A senioridade dos colaboradores determina a faixa salarial:

J�nior: at� R$ 3.000,00;
Pleno: R$ 3.000,01 a R$ 6.000,00;
S�nior: R$ 6.000,01 a R$ 20.000,00;
Corpo diretor: acima de R$ 20.000,00.
Regras de aceita��o
Ordene a listagem por senioridade e por nome.
Exemplo da sa�da pode ser vista no anexo abaixo.
*/

SELECT colab.matricula Matricula, colab.nome Colaborador, colab.salario Sal�rio, 
 (CASE WHEN colab.salario <= 3000 THEN 'J�nior'
       WHEN colab.salario > 3000 AND coLab.salario <=  6000 THEN 'Pleno'
       WHEN colab.salario > 6000 AND colab.salario <= 20000 THEN 'S�nior'
  ELSE 'Corpo Diretor'
  END) AS SENIORIDADE
FROM BRH.colaborador colab
ORDER BY SENIORIDADE, colab.nome;

