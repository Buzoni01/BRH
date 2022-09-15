/***************************************************************************************/
/* Comandos utilizados na tarefa Relatorio de departamentos: */
/***************************************************************************************/
SELECT sigla as "Sigla", nome as "Departamento" 
FROM brh.departamento
ORDER BY nome; 
/***************************************************************************************/
/* Comandos utilizados na tarefa Relatorio de dependentes: */
/***************************************************************************************/
SELECT colaborador.nome as "Colaborador", dependente.nome as "Dependente", dependente.data_nascimento as "Data de Nascimento", dependente.parentesco as "Parentesco"
FROM brh.colaborador colaborador, brh.dependente dependente
WHERE (colaborador.matricula = dependente.colaborador)
ORDER BY colaborador.nome, dependente.nome;
/***************************************************************************************/
/* Comandos utilizados para cadastrar o novo colaborador Fulano de Tal no novo projeto BI 
   para exercer o papel de Especialista de Negocios.
/***************************************************************************************/ 
/* Oracle:*/
INSERT INTO brh.papel (id, nome) VALUES (8, 'Especialista de Negocios');
/* Oracle:*/
INSERT INTO brh.colaborador (matricula, nome, cpf, email_pessoal, email_corporativo, salario, departamento, cep, complemento_endereco) 
VALUES ('A007', 'Fulano de Tal', '131.574.270-86', 'deatl@email.com', 'detal@corp.com', '3250', 'SEDES', '71222-400', 'Apto.007');
/* Oracle:*/
INSERT INTO brh.telefone_colaborador (colaborador, numero, tipo) VALUES ('A007', '(61) 99999-9999', 'M');
/* Oracle:*/
INSERT INTO brh.projeto (nome, responsavel, inicio, fim) VALUES ('BI', 'Z123', to_date('2022-08-05', 'yyyy-mm-dd'), to_date('2022-10-05', 'yyyy-mm-dd'));
/* Oracle:*/
INSERT INTO brh.atribuicao (projeto, colaborador, papel) VALUES (25, 'A007', 8);
/* Oracle:*/
COMMIT;
/***************************************************************************************/
/* Comandos utilizados para o relatório que exiba O nome do Colaborador;
O email corporativo do Colaborador; e O telefone celular do Colaborador;
/***************************************************************************************/ 
SELECT colaborador.nome as "Colaborador", colaborador.email_corporativo as "E-mail(Corporativo)", tel_colab.numero as "Telefone Celular"
FROM brh.colaborador colaborador, brh.telefone_colaborador tel_colab
WHERE (colaborador.matricula = tel_colab.colaborador) AND (tel_colab.tipo = 'M')
ORDER BY colaborador.nome;
/***************************************************************************************/
/* Comandos utilizados para o relatório de contatos.
/***************************************************************************************/ 
SELECT colaborador.nome as "Colaborador", colaborador.email_corporativo as "E-mail(Corporativo)", tel_colab.numero as "Telefone Celular"
FROM brh.colaborador colaborador, brh.telefone_colaborador tel_colab
WHERE (colaborador.matricula = tel_colab.colaborador) AND (tel_colab.tipo = 'M')
ORDER BY colaborador.nome;








