use universidade_u;

/* Inserindo informações em nossa tabela */
insert into aluno(sexo, idade, data_inscricao_curso, telefone, valor_pago_curso, ativo_sn, endereco, nome) 
values ('M', 55, '2018-12-01', '11 5555-2222', 645.22, 1, 'Avenida Paulista, 1500, ap315 - São Paulo - SP', 'João');
insert into aluno(sexo, idade, data_inscricao_curso, telefone, valor_pago_curso, ativo_sn, endereco, nome) 
values ('F', 30, '2018-11-01', '11 3333-2222', 589.22, 1, 'Rua Francisco Sá, 10 - Belo Horizonte - MG', 'Fernanda');
insert into aluno(sexo, idade, data_inscricao_curso, telefone, valor_pago_curso, ativo_sn, endereco, nome) 
values ('M', 29, '2018-12-02', '11 3333-7777', 600.55, 0, 'Avenida Dom Manuel, 300 - Fortaleza - CE', 'José');
insert into aluno(sexo, idade, data_inscricao_curso, telefone, valor_pago_curso, ativo_sn, endereco, nome) 
values ('F', 42, '2018-12-02', '11 7777-2222', 655.22, 1, 'Rua Miramar, 1200, ap112 - Natal - RN', 'Maria');
insert into aluno(sexo, idade, data_inscricao_curso, telefone, valor_pago_curso, ativo_sn, endereco, nome) 
values ('M', 37, '2018-11-15', '11 1111-2222', 612.22, 1, 'Rua João de Abreu, 650 - Goiânia - GO', 'Marcelo');

/* Consultando com WHERE */
select * from aluno where sexo = 'F';
select * from aluno where valor_pago_curso < 600;
select * from aluno where valor_pago_curso > 600;
select * from aluno where valor_pago_curso <= 600.55;
select * from aluno where valor_pago_curso >= 655.22;

/* Consultando com indicares lógicos AND/OR */
select * from aluno where sexo = 'M' and ativo_sn = 1 and valor_pago_curso <= 625;
select * from aluno where sexo = 'F' or idade >= 40;

/* Consultando intervalo com BETWEEN */
select * from aluno where idade between 40 and 60;
select * from aluno where data_inscricao_curso between '2018-11-01' and '2018-11-30';

/* Filtros com operadores IN */
select * from aluno where nome in ('Fernanda', 'Maria', 'Marcelo');
select * from aluno where nome not in ('Fernanda', 'Maria', 'Marcelo');

/* Filtros com operadores LIKE
% - indica que pode haver a existencia de qualquer conjunto de caracter no texto
_ - indica que pode haver a existencia de um ou mais caracteres em uma posicao especifica do texto 
*/
select * from aluno where nome like '%o';
select * from aluno where nome like 'm%';
select * from aluno where nome like '%er%';
select * from aluno where nome like 'm%a';
select * from aluno where nome like '__a_';
select * from aluno where nome like '%d_';

/* Ordenando o resultado */
select * from aluno order by nome ASC;
select * from aluno order by valor_pago_curso DESC;
select * from aluno order by sexo ASC, idade DESC;

/* Atualizando registros de tabelas */
update aluno set ativo_sn = 0 where nome = 'João';
update aluno set ativo_sn = 1, valor_pago_curso = 600.55 where nome = 'José';
update aluno set telefone = '11 8888-4444' where telefone = '11 7777-2222';

/* Deletando registros de tabelas*/
select * from aluno;
delete from aluno where ativo_sn = 0;
delete from aluno where idade in (30,29);
delete from aluno where idade in (30,29) or sexo = 'F';
delete from aluno where nome = 'Marcelo';