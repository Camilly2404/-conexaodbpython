-- Criação do banco de dados para gerenciar uma biblioteca escolar - SGB
create database SGB;
use SGB;
create table Alunos(
id int primary key auto_increment,
nome varchar(150) not null,
email varchar(100) not null unique,
senha varchar(200) not null,
serie varchar(20),
status enum ('Ativo','bloqueado') default 'Ativo'
);

create table Professor(
id int primary key auto_increment,
nome varchar(150) not null,
email varchar (100) not null unique,
senha varchar(200) not null,
disciplina varchar(50),
status enum('Ativo','Inativo') default 'Ativo'
);

create table Diretor(
id int primary key auto_increment,
nome varchar (150) not null,
email varchar(100) not null unique,
senha varchar(200) not null,
status enum('Ativo','Inativo') default 'Ativo'
);

create table Supervisor(
id int primary key auto_increment,
nome varchar (150) not null,
email varchar(100) not null unique,
senha varchar(200) not null,
status enum('Ativo','Inativo') default 'Ativo'
);

create table Bibliotecario(
id int primary key auto_increment,
nome varchar (150) not null,
email varchar(100) not null unique,
senha varchar(200) not null,
status enum('Ativo','Inativo') default 'Ativo'
);

create table Emprestimo(
id int primary key auto_increment,
aluno_id int,
livro_id int,
data_devolucao_prevista date not null,
data_devolucao_real date not null,
multa decimal(6,2) default 0.00,
foreign key (aluno_id) references alunos (id),
foreign key (livro_id) references livro (id)
);

create table HistoricoLeitura(
id int primary key auto_increment,
aluno_id int,
livro_id int,
data_inicio date not null,
data_fim date not null,
foreign key (aluno_id) references alunos (id),
foreign key (livro_id) references livro (id)
);

create table Sugestao(
id int primary key auto_increment,
titulo varchar(100) not null,
autor varchar(100) not null,
categoria varchar(100) not null,
justificativa text,
data_sugestao date not null,
aluno_id int,
professor_id int,
foreign key (aluno_id) references alunos (id),
foreign key (professor_id) references professor (id)
);

create table Relatorio(
id int primary key auto_increment,
tipo enum('Mensal','Turma','Aluno','Livro'),
periodo_inicio date not null,
periodo_fim date not null,
gerado_por_bibliotecario int,
gerado_por_Diretor int,
gerado_por_Supervisor int,
foreign key (gerado_por_bibliotecario) references Bibliotecario (id),
foreign key (gerado_por_Diretor) references Diretor (id),
foreign key (gerado_por_Supervisor) references Supervisor (id)
);

create table Reserva(
id int primary key auto_increment,
aluno_id int,
livro_id int,
data_reserva date not null,
status enum('Ativo','Expirada','Cancelada'),
foreign key (aluno_id) references Alunos (id),
foreign key (livro_id) references Livro (id)
);

create table Categoria(
id int primary key auto_increment,
nome varchar(150) not null,
descricao text
);

Create table Livro(
id int primary key auto_increment,
titulo varchar(100) not null,
autor varchar(50) not null,
isbn varchar(50) not null,
sinopse text,
capa text,
quantidade int not null,
categoria_id int,
foreign key (categoria_id) references Categoria (id)
);
