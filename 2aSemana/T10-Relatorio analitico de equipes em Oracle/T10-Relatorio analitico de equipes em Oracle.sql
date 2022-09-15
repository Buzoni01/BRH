/*(T10)
Tarefa
Criar um relatório completo das equipes em projetos que liste:

O nome do Departamento;
O nome do chefe do Departamento;
O nome do Colaborador;
O nome do Projeto que ele está alocado;
O nome do papel desempenhado por ele;
O número de telefone do Colaborador;
O nome do Dependente do Colaborador.
Adicione o comando no arquivo comandos_oracle.sql na sua pasta do Drive.

/***************************************************************************************/
/* CRIANDO A CONSULTA: */

SELECT d.nome nome_departamento,
       chefe.nome chefe,
       alocacao.nome,
       proj.nome Projeto,
       func.nome Cargo,
       dep.nome dependente,
       tel.numero telefone
      
  FROM brh.departamento d
 INNER JOIN brh.colaborador chefe
    ON d.chefe = chefe.matricula
 INNER JOIN brh.colaborador alocacao 
    ON d.sigla = alocacao.departamento
  LEFT JOIN brh.dependente dep
    ON dep.colaborador = alocacao.matricula
 INNER JOIN brh.telefone_colaborador  tel
    ON tel.colaborador = alocacao.matricula     
  LEFT JOIN brh.atribuicao atrib2
    ON atrib2.colaborador = alocacao.matricula
 INNER JOIN brh.papel func
    ON func.id = atrib2.papel
 INNER JOIN brh.projeto proj
    ON proj.id = atrib2.projeto        
 ORDER BY d.nome, alocacao.nome;

