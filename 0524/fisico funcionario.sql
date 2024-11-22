-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE dependente (
idDependente int PRIMARY KEY,
matriculaFunc int,
nome varchar(50),
datanasc date,
matricula func int
);

																	CREATE TABLE funcionario (
																	matricula func int PRIMARY KEY,
																	sexo varchar(10),
																	rg varchar(15),
																	estadocivil varchar(15),
																	nome varchar(50),
																	dataadmissao date,
																	cpf varchar(15),
																	endereço varchar(50),
																	datanasc date,
																	telefone varchar(15),
																	nacionalidade varchar(30)
																	);

CREATE TABLE cargo (
idcargo int PRIMARY KEY,
nomecargo varchar(50),
detainicio date,
datafim date
);

CREATE TABLE ocupar (
matricula func int,
idcargo int,
PRIMARY KEY(matricula func,idcargo),
FOREIGN KEY(matricula func) REFERENCES funcionario (matricula func)/*falha: chave estrangeira*/
);

ALTER TABLE dependente ADD FOREIGN KEY(matricula func) REFERENCES funcionario (matricula func)
