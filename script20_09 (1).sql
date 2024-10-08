-- MySQL Script generated by MySQL Workbench
-- Mon Sep 16 14:06:25 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- vendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- vendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8 ;
USE `vendas` ;

-- -----------------------------------------------------
-- Table `vendas`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`categoria` (
  `idcategoria` 		INT NOT NULL,
  `dscategoria` 		VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`produtos` (
  `idprodutos` 				INT NOT NULL,
  `dsproduto` 				VARCHAR(45) NULL,
  `preco` 					FLOAT NULL,
  `qtdade` 					INT NULL,
  `foto` 					LONGBLOB NULL,
  `produtoscol` 			VARCHAR(45) NULL,
  `categoria_idcategoria` 	INT NOT NULL, -- chave estrangeira
  PRIMARY KEY (`idprodutos`),
 -- INDEX `fk_produtos_categoria_idx` (`categoria_idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_categoria`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `vendas`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`clientes` (
  `idclientes` 		INT NOT NULL,
  `nome` 			VARCHAR(100) NULL,
  `email` 			VARCHAR(100) NULL,
  `senha` 			VARCHAR(100) NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`pedidos` (
  `idpedidos` 				INT NOT NULL,
  `data` 					DATE NULL,
  `status` 					VARCHAR(45) NULL,
  `sessao` 					VARCHAR(45) NULL,
  `pedidoscol` 				VARCHAR(45) NULL,
  `clientes_idclientes` 	INT NOT NULL,
  PRIMARY KEY (`idpedidos`),
  -- INDEX `fk_pedidos_clientes1_idx` (`clientes_idclientes` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `vendas`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`pedidoitens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`pedidoitens` (
  `idpedidoitens` 			INT NOT NULL,
  `qtade` 					INT NULL,
  `preco` 					FLOAT NULL,
  `total` 					FLOAT NULL,
  `pedidoitenscol` 			VARCHAR(45) NULL,
  `produtos_idprodutos` 	INT NOT NULL, -- chave estrangeira
  `pedidos_idpedidos` 		INT NOT NULL, -- chave estrangeira
  PRIMARY KEY (`idpedidoitens`),
  -- INDEX `fk_pedidoitens_produtos1_idx` (`produtos_idprodutos` ASC) VISIBLE,
  -- INDEX `fk_pedidoitens_pedidos1_idx` (`pedidos_idpedidos` ASC) VISIBLE,
  CONSTRAINT `fk_pedidoitens_produtos1`
    FOREIGN KEY (`produtos_idprodutos`)
    REFERENCES `vendas`.`produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoitens_pedidos1`
    FOREIGN KEY (`pedidos_idpedidos`)
    REFERENCES `vendas`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
