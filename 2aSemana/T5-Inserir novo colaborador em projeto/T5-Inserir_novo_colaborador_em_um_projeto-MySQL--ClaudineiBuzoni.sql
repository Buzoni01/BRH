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


INSERT INTO PROJETO VALUES (
 5,
'BI',
'Z123',
'2022-08-05',
'2022-10-25'
);
SELECT * FROM PROJETO;


INSERT INTO PAPEL VALUES (
8,'Especialista de Negocios'
);
SELECT * FROM PAPEL;


INSERT INTO COLABORADOR VALUES (
'A007', '131.574.270-86', 'Fulano de Tal', 'detal@email.com', 'detal@corp.com', '3250.49', 'SEDES', '71222-400', 'Apto.007'
);
SELECT * FROM COLABORADOR;


INSERT INTO TELEFONE_COLABORADOR VALUES (
'(43)94749-0007','A007', 'M'
);
SELECT * FROM TELEFONE_COLABORADOR;


INSERT INTO ATRIBUICAO VALUES (
'A007', 5, 8
);
SELECT * FROM ATRIBUICAO;
