/*(T5)  
Tarefa
Cadastrar o novo colaborador Fulano de Tal no novo projeto BI para exercer o papel de Especialista de 
Negócios.

Observação
Escolha os valores dos outros campos para o Colaborador;
Escolha os valores dos campos do Projeto;
O colaborador não tem Dependentes;
O colaborador possui o telefone celular (61) 9 9999-9999.
Atenção à ordem em que os registros devem ser inseridos */


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
INSERT INTO brh.atribuicao (projeto, colaborador, papel) VALUES (5, 'A007', 8);
/* Oracle:*/
COMMIT;

