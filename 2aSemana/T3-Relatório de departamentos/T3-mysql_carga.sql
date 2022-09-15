SET FOREIGN_KEY_CHECKS = 0;

insert into papel 
	(nome) 
values 
	('Desenvolvedor(a)'), 
	('Arquiteto(a) de Software'), 
	('Engenheiro(a) DevOps'), 
	('Product Owner'), 
	('Scrum Master'), 
	('DBA'), 
	('Cientista de Dados');

insert into departamento 
	(sigla, nome, chefe, departamento_superior)
values
	('DIR', 'Diretoria', 'A123', null),
	('DEPTI', 'Departamento de Tecnologia da Informação', 'B123', 'DIR'),
	('SEDES', 'Seção de Desenvolvimento de Soluções', 'C123', 'DEPTI'),
	('SEOPE', 'Seção de Operações e Monitoramento', 'D123', 'DEPTI'),
	('SESEG', 'Seção de Segurança da Informação', 'E123', 'DEPTI'),
	('DEREH', 'Departamento de Recursos Humanos', 'F123', 'DIR'),
	('SEFOL', 'Seção de Folha de Pagamento', 'G123', 'DEREH'),
	('SECAP', 'Seção de Capacitação Continuada', 'H123', 'DEREH');
	
insert into colaborador 
	(matricula, nome, cpf, email_pessoal, email_corporativo, salario, departamento, cep, complemento_endereco)
values
	('A123', 'Ana', '376.574.270-86', 'ana@email.com', 'ana@corp.com', '48666', 'DIR', '71222-100', 'Casa 1'),
	('B123', 'Bia', '325.066.470-74', 'bia@email.com', 'bia@corp.com', '2967', 'DEPTI', '71222-200', 'Apto 101 - Ed Bonitão'),
	('C123', 'Caio', '639.999.330-03', 'caio@email.com', 'caio@corp.com', '6512', 'SEDES', '71222-300', 'Casa 4'),
	('D123', 'Dani', '735.960.820-13', 'dani@email.com', 'dani@corp.com', '2784', 'SEOPE', '71222-700', 'Cond. Vila Real - Casa 3'),
	('E123', 'Eli', '215.347.960-61', 'eli@email.com', 'eli@corp.com', '6233', 'SESEG', '71222-700', 'Cond. Vila Real - Casa 32'),
	('F123', 'Fred', '512.154.870-29', 'fred@email.com', 'fred@corp.com', '6847', 'DEREH', '71222-200', 'Apto 202 - Ed Bonitão'),
	('G123', 'Gabi', '750.471.040-79', 'gabi@email.com', 'gabi@corp.com', '7220', 'SEFOL', '71222-400', 'Chácara 12'),
	('H123', 'Hugo', '206.642.180-40', 'hugo@email.com', 'hugo@corp.com', '6357', 'SECAP', '71222-300', 'Casa 7'),
	('I123', 'Ivo', '239.264.900-63', 'ivo@email.com', 'ivo@corp.com', '6854', 'SEDES', '71222-400', 'Chácara 6'),
	('J123', 'João', '945.334.020-03', 'joão@email.com', 'joão@corp.com', '2724', 'SEOPE', '71222-400', 'Chácara 16'),
	('K123', 'Kelly', '529.049.230-55', 'kelly@email.com', 'kelly@corp.com', '7500', 'SESEG', '71222-300', 'Casa 68'),
	('L123', 'Lara', '099.710.680-87', 'lara@email.com', 'lara@corp.com', '6854', 'SEFOL', '71222-700', 'Cond. Vila Real - Casa 9'),
	('M123', 'Maria', '943.762.640-59', 'maria@email.com', 'maria@corp.com', '6999', 'SECAP', '71222-400', 'Chácara 16'),
	('N123', 'Nei', '339.099.960-43', 'nei@email.com', 'nei@corp.com', '5487', 'SEDES', '71222-700', 'Cond. Vila Real - Casa 15'),
	('O123', 'Olívia', '620.476.920-08', 'olivia@email.com', 'olívia@corp.com', '6895', 'SEOPE', '71222-200', 'Apto 303 - Ed Bonitão'),
	('P123', 'Paulo', '609.136.270-46', 'paulo@email.com', 'paulo@corp.com', '6456', 'SESEG', '71222-300', 'Casa 16'),
	('Q123', 'Quênia', '300.976.320-40', 'quenia@email.com', 'quênia@corp.com', '2869', 'SEFOL', '71222-400', 'Chácara 2'),
	('R123', 'Rui', '203.460.970-02', 'rui@email.com', 'rui@corp.com', '6778', 'SECAP', '71222-700', 'Cond. Vila Real - Casa 11'),
	('S123', 'Sara', '192.379.870-72', 'sara@email.com', 'sara@corp.com', '2864', 'SEDES', '71222-200', 'Apto 404 - Ed Bonitão'),
	('T123', 'Tati', '007.563.930-00', 'tati@email.com', 'tati@corp.com', '6555', 'SEOPE', '71222-400', 'Chácara 4'),
	('U123', 'Uri', '701.845.310-04', 'uri@email.com', 'uri@corp.com', '49068', 'DIR', '71222-100', 'Casa 30'),
	('V123', 'Vini', '164.902.830-00', 'vini@email.com', 'vini@corp.com', '5335', 'SEFOL', '71222-200', 'Apto 505 - Ed Bonitão'),
	('W123', 'Wando', '638.965.680-78', 'wando@email.com', 'wando@corp.com', '5621', 'SECAP', '71222-400', 'Chácara 8'),
	('X123', 'Xena', '128.798.200-06', 'xena@email.com', 'xena@corp.com', '6632', 'SEDES', '71222-700', 'Cond. Vila Real - Casa 23'),
	('Y123', 'Yara', '174.247.350-47', 'yara@email.com', 'yara@corp.com', '5741', 'SEOPE', '71222-200', 'Apto 606 - Ed Bonitão'),
	('Z123', 'Zico', '103.845.160-41', 'zico@email.com', 'zico@corp.com', '49944', 'DIR', '71222-400', 'Chácara 19');
	
insert into endereco
	(cep, uf, cidade, bairro, logradouro)
values
	('71222-100', 'DF', 'Brasília', 'Águas Claras', 'Avenida das Castanheiras'),
	('71222-200', 'TO', 'Palmas', 'Plano Diretor Norte', 'Área Residencial Nordeste - ARNE'),
	('71222-300', 'AM', 'Manaus', 'Presidente Vargas', 'Rua da Legião'),
	('71222-400', 'MG', 'Patos de Minas', 'Major Porto', 'Avenida Principal'),
	('71222-700', 'PB', 'João Pessoa', 'Cabo Branco', 'Avenida Costeira');
	
insert into telefone_colaborador 
	(colaborador, numero, tipo)
values
	('A123', '(43) 97503-7342', 'M'), 
	('A123', '(43) 3334-4676', 'R'),
	('B123', '(43) 98730-7585', 'M'), 
	('B123', '(43) 2236-6847', 'R'),
	('C123', '(45) 98919-8791', 'M'), 
	('C123', '(45) 3213-7045', 'R'),
	('D123', '(42) 97115-7233', 'M'), 
	('D123', '(42) 3457-4737', 'R'),
	('E123', '(45) 98086-0216', 'M'), 
	('E123', '(45) 3894-6678', 'R'),
	('F123', '(41) 98226-6125', 'M'), 
	('G123', '(44) 99555-3353', 'M'),
	('G123', '(44) 2613-7831', 'R'),
	('H123', '(44) 98116-4624', 'M'), 
	('H123', '(44) 2613-7831', 'R'),
	('I123', '(44) 98490-1528', 'M'),
	('J123', '(44) 98662-3114', 'M'),
	('J123', '(44) 2711-6813', 'R'),
	('K123', '(44) 99418-5539', 'M'),
	('L123', '(44) 97945-1718', 'M'),
	('L123', '(44) 2613-7831', 'R'),
	('M123', '(43) 98783-3567', 'M'), 
	('M123', '(43) 3182-7732', 'R'),
	('N123', '(45) 99133-2271', 'M'), 
	('N123', '(45) 2987-4535', 'R'),
	('O123', '(44) 99153-3715', 'M'), 
	('O123', '(44) 2484-0846', 'R'),
	('P123', '(45) 97998-5727', 'M'), 
	('P123', '(45) 2713-5787', 'R'),
	('Q123', '(42) 99312-3648', 'M'), 
	('R123', '(46) 98135-6010', 'M'),
	('R123', '(46) 3622-4323', 'R'),
	('S123', '(43) 96711-4212', 'M'), 
	('S123', '(43) 2525-8373', 'R'),
	('T123', '(41) 99743-3624', 'M'), 
	('T123', '(41) 2739-7614', 'R'),
	('U123', '(43) 99948-6048', 'M'), 
	('U123', '(43) 2496-7601', 'R'),
	('V123', '(44) 97450-4926', 'M'), 
	('V123', '(44) 2880-8483', 'R'),
	('W123', '(42) 98329-7151', 'M'), 
	('X123', '(44) 98122-8742', 'M'),
	('X123', '(44) 2471-1542', 'R'),
	('Y123', '(45) 96825-7324', 'M'), 
	('Z123', '(42) 96782-4335', 'M'),
	('Z123', '(42) 3469-3136', 'R'); 
	
insert into projeto 
	(nome, responsavel, inicio, fim)
values 
	('Comex', 'G123', '2022-01-01', null),
	('Oracle Exadata', 'P123', '2020-08-01', '2021-08-31'),
	('Dimenx', 'D123', '2021-01-01', '2021-12-31'),
	('BRH', 'T123', '2022-05-01', null);
	
insert into dependente 
	(cpf, colaborador, nome, parentesco, data_nascimento)
values
	('243.361.552-67', 'A123', 'Maitê', 'Filho(a)', '2015-01-01'),
	('673.340.136-38', 'A123', 'Miguel', 'Filho(a)', '2015-08-02'),
	('437.814.540-53', 'A123', 'Lucas', 'Cônjuge', '1985-06-07'),
	('136.155.762-17', 'B123', 'Aurora', 'Filho(a)', '2021-01-14'),
	('185.252.486-30', 'C123', 'Heitor', 'Filho(a)', '2005-01-20'),
	('338.860.528-93', 'C123', 'Laura', 'Cônjuge', '1975-06-30'),
	('737.572.374-55', 'C123', 'Maya', 'Filho(a)', '2018-01-07'),
	('772.141.271-48', 'D123', 'Gabriel', 'Cônjuge', '1960-09-09'),
	('764.194.838-32', 'E123', 'Benício', 'Cônjuge', '1976-11-17'),
	('616.187.472-58', 'F123', 'Samuel', 'Filho(a)', '2016-07-10'),
	('785.512.478-08', 'H123', 'Davi', 'Filho(a)', '2008-03-11'),
	('007.981.185-04', 'I123', 'Antonella', 'Filho(a)', '2019-05-05'),
	('936.335.601-90', 'I123', 'Eloá', 'Filho(a)', '2003-08-18'),
	('371.508.442-19', 'J123', 'Liz', 'Cônjuge', '1991-11-24'),
	('531.325.332-89', 'K123', 'Guilherme', 'Cônjuge', '1995-06-06'),
	('648.420.453-53', 'L123', 'Benjamim', 'Filho(a)', '2009-06-07'),
	('841.486.580-10', 'L123', 'Gael', 'Filho(a)', '2008-07-11'),
	('757.125.312-83', 'M123', 'Rebeca', 'Filho(a)', '2013-08-01'),
	('112.675.927-96', 'N123', 'Luna', 'Filho(a)', '2011-12-31'),
	('130.810.418-99', 'O123', 'Ayla', 'Filho(a)', '2014-12-25'),
	('632.282.137-73', 'O123', 'Beatriz', 'Filho(a)', '2014-04-01'),
	('248.372.338-13', 'Q123', 'Ravi', 'Filho(a)', '2015-01-22'),
	('314.352.484-73', 'R123', 'Noah', 'Filho(a)', '2019-09-23'),
	('718.314.271-09', 'S123', 'Levi', 'Filho(a)', '2021-06-19'),
	('435.604.284-08', 'S123', 'Arthur', 'Filho(a)', '2022-01-05'),
	('028.544.528-60', 'T123', 'Alice', 'Filho(a)', '2018-11-25'),
	('434.084.223-03', 'T123', 'Cecília', 'Filho(a)', '2016-12-07'),
	('374.874.270-30', 'V123', 'Helena', 'Cônjuge', '1984-06-07'),
	('787.929.741-39', 'V123', 'Júlia', 'Filho(a)', '2006-03-31'),
	('782.961.224-21', 'V123', 'Tainá', 'Filho(a)', '1995-03-24'),
	('563.803.531-19', 'W123', 'Camila', 'Cônjuge', '1970-03-01'),
	('647.672.118-67', 'X123', 'Alexandre', 'Cônjuge', '1974-08-04'),
	('164.363.845-96', 'X123', 'Milena', 'Filho(a)', '1996-06-13'),
	('930.064.462-91', 'Y123', 'Jéssica', 'Filho(a)', '2002-02-22'),
	('333.716.787-09', 'Z123', 'Rui', 'Filho(a)', '2009-04-15');

insert into atribuicao 
	(projeto, colaborador, papel)
values 
	(1, 'B123', 2),
	(2, 'C123', 2),
	(3, 'E123', 2),
	(1, 'F123', 5),
	(3, 'H123', 1),
	(2, 'I123', 5),
	(3, 'J123', 5),
	(4, 'K123', 2),
	(1, 'L123', 1),
	(2, 'M123', 3),
	(3, 'N123', 1),
	(1, 'O123', 1),
	(4, 'Q123', 1),
	(2, 'R123', 3),
	(2, 'S123', 3),
	(2, 'V123', 3),
	(2, 'W123', 3),
	(1, 'X123', 1),
	(1, 'Y123', 1),
	(1, 'R123', 1),
	(3, 'R123', 5),
	(4, 'R123', 2);
	
set foreign_key_checks = 1;