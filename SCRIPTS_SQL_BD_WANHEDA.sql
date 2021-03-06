-- MySQL Script generated by MySQL Workbench
-- Thu Jun  3 00:02:38 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema POSTRES_WANHEDA
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `POSTRES_WANHEDA` ;

-- -----------------------------------------------------
-- Schema POSTRES_WANHEDA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `POSTRES_WANHEDA` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `POSTRES_WANHEDA` ;

-- -----------------------------------------------------
-- Table `CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CLIENTE` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `CLIENTE` (
  `idCLIENTE` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDO` VARCHAR(45) NOT NULL,
  `CEDULA` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(11) NOT NULL,
  `UBICACION` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idCLIENTE`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idCLIENTE_UNIQUE` ON `CLIENTE` (`idCLIENTE` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DELIVERY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DELIVERY` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `DELIVERY` (
  `idDELIVERY` INT NOT NULL AUTO_INCREMENT,
  `UBICACION` VARCHAR(300) NOT NULL,
  `FECHA` DATETIME NOT NULL,
  `STATUS` VARCHAR(10) NOT NULL,
  `PRODUCTOS_HAS_FACTURA_ID` INT NOT NULL,
  PRIMARY KEY (`idDELIVERY`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idDELIVERY_UNIQUE` ON `DELIVERY` (`idDELIVERY` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EMPLEADO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `EMPLEADO` (
  `idEMPLEADO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDO` VARCHAR(45) NOT NULL,
  `CODIGO_EMPLEADO` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idEMPLEADO`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idEMPLEADO_UNIQUE` ON `EMPLEADO` (`idEMPLEADO` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `FACTURA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACTURA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `FACTURA` (
  `idFACTURA` INT NOT NULL AUTO_INCREMENT,
  `FECHA_EMISION` DATETIME NOT NULL,
  `CLIENTE_IDCLIENTE` INT NOT NULL,
  `EMPLEADO_IDEMPLEADO` INT NOT NULL,
  PRIMARY KEY (`idFACTURA`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idFACTURA_UNIQUE` ON `FACTURA` (`idFACTURA` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCTOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCTOS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUCTOS` (
  `idPRODUCTO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `SERIAL` VARCHAR(10) NOT NULL,
  `PRECIO` FLOAT NOT NULL,
  PRIMARY KEY (`idPRODUCTO`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idPRODUCTO_UNIQUE` ON `PRODUCTOS` (`idPRODUCTO` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCTOS_has_FACTURA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCTOS_has_FACTURA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUCTOS_has_FACTURA` (
  `PRODUCTOS_idPRODUCTO` INT NOT NULL,
  `FACTURA_idFACTURA` INT NOT NULL,
  PRIMARY KEY (`PRODUCTOS_idPRODUCTO`, `FACTURA_idFACTURA`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
