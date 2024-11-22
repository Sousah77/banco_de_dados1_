-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE FORNECEDOR (
codigoFornecedor int PRIMARY KEY,
nome varchar(50),
endereço varchar(50),
cidade varchar(30),
estado varchar(2),
telefone varchar(15)
)

CREATE TABLE ORDEM_COMPRA (
codigoOC int PRIMARY KEY,
valorTotal Texto(1),
nomeResponsavel Texto(1),
data date,
codigoFornecedor int,
FOREIGN KEY(codigoFornecedor) REFERENCES FORNECEDOR (codigoFornecedor)
)

CREATE TABLE MATERIAL (
codigoMaterial int PRIMARY KEY,
descricao Texto(1),
qtde Texto(1),
valorUnitario Texto(1),
valorTotal Texto(1)
)

CREATE TABLE ItemCompra (
codigoIC Número(4) PRIMARY KEY,
codigoMaterial int,
codigoOC int,
FOREIGN KEY(codigoMaterial) REFERENCES MATERIAL (codigoMaterial),
FOREIGN KEY(codigoOC) REFERENCES ORDEM_COMPRA (codigoOC)
)

