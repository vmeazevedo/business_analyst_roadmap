use universidade_u;

/* PRIMARY KEY */
/* Descrevendo e alterando a estrutura de tabelas */
desc aluno;
 
/* add de nova coluna */
alter table aluno add cpf varchar(11);
alter table aluno add email varchar(150) after idade;
 
/* modify uma coluna */
alter table aluno modify column cpf varchar(14);
 
/* drop uma coluna */
alter table aluno drop column cpf;

/* inserindo dados em uma coluna */
update aluno set cpf = '111.111.111-11' where nome = 'João';
update aluno set cpf = '222.111.111-11' where nome = 'Fernanda';
update aluno set cpf = '333.111.111-11' where nome = 'José';
update aluno set cpf = '444.111.111-11' where nome = 'Maria';
update aluno set cpf = '555.111.111-11' where nome = 'Marcelo'; 

/* criando um PK NATURAL */
alter table aluno modify cpf varchar(14) primary key;
/* criando um PK ARTIFICIAL */
alter table aluno add idaluno int primary key auto_increment;


/* COLUNAS DEVEM SER ATÔMICAS */
/* Campos compostos devem ser decompostos em colunas - Decompondo a coluna endereço */
alter table aluno add logradouro varchar(100);
alter table aluno add numero varchar(10);
alter table aluno add complemento varchar(20);
alter table aluno add bairro varchar(100);
alter table aluno add cidade varchar(50);
alter table aluno add estado char(2);

update aluno set logradouro = 'Avenida Paulista', numero = '1500', complemento = 'ap315', bairro = 'Bela Vista', cidade = 'São Paulo', estado = 'SP' where idaluno = 1;
update aluno set logradouro = 'Rua Francisco Sá', numero = '10', complemento = '', bairro = 'Gutierrez', cidade = 'Belo Horizonte', estado = 'MG' where idaluno = 2;
update aluno set logradouro = 'Avenida Dom Manuel', numero = '300', complemento = '', bairro = 'Centro', cidade = 'Fortaleza', estado = 'CE' where idaluno = 3;
update aluno set logradouro = 'Rua Miramar', numero = '1200', complemento = 'ap112', bairro = 'Rocas', cidade = 'Natal', estado = 'RN' where idaluno = 4;
update aluno set logradouro = 'Rua João de Abreu', numero = '650', complemento = '', bairro = 'Setor Leste', cidade = 'Goiânia', estado = 'GO' where idaluno = 5;
alter table aluno drop endereco;

/* CARDINALIDADE DE RELACIONAMENTO - 1:N */
/* Campos multivalorados devem ser transformados em uma nova tabela - Criando tabela TELEFONE */
create table telefone(
idtelefone int auto_increment primary key,
numero varchar(20),
tipo char(3),
fk_idaluno int
);

/* criando uma chave estrangeira em uma tabela ja criada */
alter table telefone add constraint fk_aluno_telefone foreign key(fk_idaluno) references aluno(idaluno);

insert into telefone(numero, tipo, fk_idaluno) values ('11 5555-5555', 'res', 4);
insert into telefone(numero, tipo, fk_idaluno) values ('11 5555-7777', 'res', 3);
insert into telefone(numero, tipo, fk_idaluno) values ('11 5555-8888', 'res', 3);
insert into telefone(numero, tipo, fk_idaluno) values ('11 5555-9999', 'res', 3);
select * from telefone;




