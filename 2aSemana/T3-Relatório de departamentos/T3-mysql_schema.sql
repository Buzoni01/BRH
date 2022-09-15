drop schema brh;

create schema brh;
use brh;

create table papel ( /*OK*/
	id bigint not null auto_increment,
	nome varchar(255) not null,
	constraint pk_papel primary key (id),
	constraint papel_unico unique (nome)
);

create table departamento ( /*OK*/
	sigla varchar(6) not null,
	nome varchar (255) not null,
	chefe varchar(10) not null,
	departamento_superior varchar(6),
	constraint pk_departamento primary key (sigla),
	constraint fk_departamento_superior
		foreign key (departamento_superior)
		references departamento (sigla)
);

create table endereco ( /*OK*/
	cep varchar(10) not null,
	uf char(2) not null,
	cidade varchar(255) not null,
	bairro varchar(255) not null,
	logradouro varchar(255) not null,
	constraint pk_endereco primary key (cep)
);

create table colaborador ( /*OK*/
	matricula varchar(10) not null,
	cpf char(14) not null,
	nome varchar(255) not null,
	email_pessoal varchar(255) not null,
	email_corporativo varchar(255) not null,
	salario decimal(10,2) not null,
	departamento varchar(6),
	cep varchar(10) not null,
	complemento_endereco varchar(255),
	constraint pk_colaborador primary key (matricula),
	constraint fk_departamento_colaborador
		foreign key (departamento)
		references departamento (sigla),
	constraint fk_endereco_colaborador 
		foreign key (cep)
		references endereco (cep)
);

create table telefone_colaborador( /*OK*/
	numero varchar(20) not null,
	colaborador varchar(10) not null,
	tipo char(1) not null default 'R',
	constraint pk_telefone primary key (colaborador, numero),
	constraint fk_telefone_colaborador
		foreign key (colaborador)
		references colaborador (matricula),
	constraint tipo_telefone_valido check (tipo in ('R', 'M', 'C')) -- Residencial, Móvel, Corporativo
);

create table dependente(
	cpf char(14) not null,
	nome varchar(255) not null,
	data_nascimento date not null,
	parentesco varchar(20) not null,
	colaborador varchar(10) not null,
	constraint pk_dependente primary key (cpf),
	constraint fk_dependente_colaborador
		foreign key (colaborador)
		references colaborador (matricula),
	constraint parentesco_valido check (parentesco in ('Cônjuge', 'Filho(a)', 'Pai', 'Mãe'))
);

create table projeto (
	id bigint not null auto_increment,
	nome varchar(255) not null,
	responsavel varchar(10),
	inicio date not null,
	fim date,
	constraint pk_projeto primary key (id),
	constraint fk_colaborador_projeto
		foreign key (responsavel)
		references colaborador (matricula),
	constraint projeto_unico unique (nome)
);

create table atribuicao (
	colaborador varchar(10) not null,
	projeto bigint not null,
	papel bigint not null,
	constraint pk_atribuicao primary key (colaborador, projeto, papel)
);

alter table departamento add constraint fk_chefe_departamento
	foreign key (chefe) references colaborador (matricula);
	
