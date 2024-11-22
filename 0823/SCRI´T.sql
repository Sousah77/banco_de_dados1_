-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
NumeroID int PRIMARY KEY, NOT NULL,
nome varchar(30), NOT NULL,
endereço varchar(30), NOT NULL,
telefone varchar(30), NOT NULL,
email varchar(30), NOT NULL,
dataCadastro date, NOT NULL,
status varchar(30) NOT NULL,
)

CREATE TABLE VEÍCULO (
numeroRegistro int PRIMARY KEY, NOT NULL,
marca varchar(30), NOT NULL,
modelo varchar(30), NOT NULL,
anoFabricação varchar(30), NOT NULL,
tipo varchar(30), NOT NULL,
placa varchar(30), NOT NULL,
NumeroID int, NOT NULL,
FOREIGN KEY(NumeroID) REFERENCES CLIENTE (NumeroID)
)

CREATE TABLE APÓLICE (
numero int PRIMARY KEY, NOT NULL,
descrição varchar(15), NOT NULL,
valor varchar(15), NOT NULL,
numeroRegistro int, NOT NULL,
FOREIGN KEY(numeroRegistro) REFERENCES VEÍCULO (numeroRegistro)
)

CREATE TABLE PESSOA FISICA (
sexo varchar(30), NOT NULL,
estadoCivil varchar(30), NOT NULL,
habilitação varchar(30), NOT NULL,
profissão varchar(30), NOT NULL,
CPF varchar(30), NOT NULL,
RG varchar(30), NOT NULL,
faixaRenda varchar(30),  NOT NULL,
dataNasc date, NOT NULL,
NumeroID int, NOT NULL,
FOREIGN KEY(NumeroID) REFERENCES CLIENTE (NumeroID)
)

CREATE TABLE PESSOA JURIDICA (
razaoSocial varchar(30), NOT NULL,
CNPJ varchar(30), NOT NULL,
inscriçãoEstadual varchar(30), NOT NULL,
contatoResponsavel varchar(30), NOT NULL,
ramoAtividade varchar(30), NOT NULL,
NumeroID int, NOT NULL,
FOREIGN KEY(NumeroID) REFERENCES CLIENTE (NumeroID)
)

CREATE TABLE ACIDENTE (
numeroID int PRIMARY KEY, NOT NULL,
data date, NOT NULL,
hora time, NOT NULL,
local varchar(30), NOT NULL,
descrição varchar(30), NOT NULL,
numeroRegistro int, NOT NULL,
FOREIGN KEY(numeroRegistro) REFERENCES VEÍCULO (numeroRegistro)
)

