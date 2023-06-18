-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab8` DEFAULT CHARACTER SET utf8mb3 ;
USE `lab8` ;

-- -----------------------------------------------------
-- Table `lab8`.`ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`ciudades` (
  `idciudades` INT NOT NULL,
  `nombreCiudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idciudades`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lab8`.`empresaseguros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`empresaseguros` (
  `idempresaSeguros` INT NOT NULL,
  `nombreEmpresaSeguro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idempresaSeguros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lab8`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`especialidad` (
  `idespecialidad` INT NOT NULL,
  `nombreEspecialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespecialidad`),
  UNIQUE INDEX `idespecialidad_UNIQUE` (`idespecialidad` ASC) VISIBLE,
  UNIQUE INDEX `nombreEspecialidad_UNIQUE` (`nombreEspecialidad` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lab8`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATETIME NOT NULL,
  `codigoPucp` INT NOT NULL,
  `correoPucp` VARCHAR(45) NOT NULL,
  `contrasenia` VARCHAR(45) NOT NULL,
  `confirmacionContrasenia` VARCHAR(45) NOT NULL,
  `idespecialidad` INT NOT NULL,
  `costoTotal` INT NOT NULL,
  `contraHasheada` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_usuarios_especialidad_idx` (`idespecialidad` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_especialidad`
    FOREIGN KEY (`idespecialidad`)
    REFERENCES `lab8`.`especialidad` (`idespecialidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lab8`.`historialviajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab8`.`historialviajes` (
  `identificadorViaje` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `idCiudadDestino` INT NOT NULL,
  `idCiudadOrigen` INT NOT NULL,
  `fechaReserva` DATETIME NOT NULL,
  `fechaViaje` DATETIME NOT NULL,
  `numeroBoletos` INT NOT NULL,
  `idEmpresaSeguro` INT NOT NULL,
  `costoUnitario` INT NOT NULL,
  `costoViaje` INT NULL DEFAULT NULL,
  PRIMARY KEY (`identificadorViaje`),
  UNIQUE INDEX `identificadorViaje_UNIQUE` (`identificadorViaje` ASC) VISIBLE,
  INDEX `fk_historialViajes_usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_historialViajes_empresaSeguros1_idx` (`idEmpresaSeguro` ASC) VISIBLE,
  INDEX `fk_historialViajes_ciudades1_idx` (`idCiudadDestino` ASC) VISIBLE,
  INDEX `fk_historialViajes_ciudades2_idx` (`idCiudadOrigen` ASC) VISIBLE,
  CONSTRAINT `fk_historialViajes_ciudades1`
    FOREIGN KEY (`idCiudadDestino`)
    REFERENCES `lab8`.`ciudades` (`idciudades`),
  CONSTRAINT `fk_historialViajes_ciudades2`
    FOREIGN KEY (`idCiudadOrigen`)
    REFERENCES `lab8`.`ciudades` (`idciudades`),
  CONSTRAINT `fk_historialViajes_empresaSeguros1`
    FOREIGN KEY (`idEmpresaSeguro`)
    REFERENCES `lab8`.`empresaseguros` (`idempresaSeguros`),
  CONSTRAINT `fk_historialViajes_usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `lab8`.`usuarios` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
