create database atv2_bd3;
use atv2_bd3;

create table tb_turma(
	id_turma int unsigned auto_increment primary key,
    sigla varchar(10) unique,
    nome varchar(100)
); 

create table tb_disciplina(
	id_disciplina int  unsigned auto_increment primary key,
	id_turma int unsigned,
    sigla varchar(100),
    constraint turma foreign key (id_turma) references tb_turma(id_turma)
);

create table tb_alunos(

	id_aluno int  unsigned auto_increment primary key,
    id_turma int unsigned,
    nome varchar(100),
    cpf varchar(11) unique,
    rg varchar(9),
    tel_aluno varchar(11),
    tel_responsavel varchar(11),
    email varchar(100),
    dt_nascimento date,
    constraint id_turma foreign key (id_turma) references tb_turma(id_turma)
);

create table tb_frequencia(
	id_freq int unsigned auto_increment primary key,
	id_aluno int unsigned,
    id_disciplina int unsigned,
    data_chamada date,
    frequencia decimal(2,2),
	foreign key (id_aluno) references tb_alunos(id_aluno),
	foreign key (id_disciplina) references tb_disciplina(id_disciplina)
);



drop database atv2_bd3;

