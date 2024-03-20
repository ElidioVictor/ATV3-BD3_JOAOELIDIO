#trigger
use atv2_bd3;

create table tb_alunos_bakcup(
	id_aluno int  unsigned auto_increment primary key,
    id_turma int unsigned,
    nome varchar(100),
    cpf varchar(11) unique,
    rg varchar(9),
    tel_aluno varchar(11),
    tel_responsavel varchar(11),
    email varchar(100),
    dt_nascimento date,
    date_delete date,
    constraint id_turmas foreign key (id_turma) references tb_turma(id_turma)
);

delimiter $

create trigger delete_aluno before delete on tb_alunos
for each row
begin
insert into tb_alunos_backup
set
id_aluno = old.id_aluno,
id_turma = old.id_turma,
nome =  old.nome,
cpf =  old.cpf,
rg =  old.rg,
tel_aluno =  old.tel_aluno,
tel_responsavel =  old.tel_responsavel,
email =  old.email,
dt_nascimento =  old.dt_nascimento,
data_delete = now();
end$

