-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE DEPARTAMENTO (
	NumeroDepto int not null PRIMARY KEY,
	Nome varchar(50) not null
);

CREATE TABLE CURSO (
	NumeroCurso int not null PRIMARY KEY,
	Nome varchar(50), not null 
	NumeroDepto int, chave estrangeira 
FOREIGN KEY(NumeroDepto) REFERENCES DEPARTAMENTO (NumeroDepto)
);

CREATE TABLE ALUNO (
	NumeroRaAluno int PRIMARY KEY,
	Nome varchar(50), not null
	Status varchar(20),
	NumeroCurso int, chave estrangeira
FOREIGN KEY(NumeroCurso) REFERENCES CURSO (NumeroCurso)
);

CREATE TABLE HISTORICO (
	IDHistorico int not null PRIMARY KEY,
	Nota decimal(9,2), not null 
	Falta decimal(9,2), not null 
	NumeroRaAluno int, not null chave estrangeira
	NumeroProfessor int, not null chave estrangeira
	NumeroDisciplina int, not null chave estrangeira
FOREIGN KEY(NumeroRaAluno) REFERENCES ALUNO (NumeroRaAluno),


);

CREATE TABLE PROFESSOR (
	NumeroProfessor int not null PRIMARY KEY,
	Nome varchar(50), not null
	Titulo varchar(50) not null 
);

CREATE TABLE DISCIPLINA (
	NumeroDisciplina int not null PRIMARY KEY,
	Nome varchar(50), not null,
	CargaHoraria int not null 
);

CREATE TABLE lecionar (
	id int not null PRIMARY KEY,
	NumeroProfessor int, not null chave estrangeira 
	NumeroDisciplina int, not null chave estrangeira
	FOREIGN KEY(NumeroProfessor) REFERENCES PROFESSOR (NumeroProfessor),
	FOREIGN KEY(NumeroDisciplina) REFERENCES DISCIPLINA (NumeroDisciplina)
);

ALTER TABLE HISTORICO ADD FOREIGN KEY(NumeroProfessor) REFERENCES PROFESSOR (NumeroProfessor)
ALTER TABLE HISTORICO ADD FOREIGN KEY(NumeroDisciplina) REFERENCES DISCIPLINA (NumeroDisciplina)
