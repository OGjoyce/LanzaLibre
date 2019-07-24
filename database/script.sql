-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema phpmyadmin
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Departamento` VARCHAR(50) NULL,
  `longitud` FLOAT NULL,
  `latitud` FLOAT NULL,
  `altitud` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Municipios` (
  `idMunicipios` INT NOT NULL,
  `Municipio` VARCHAR(45) NULL,
  `longitud` FLOAT NULL,
  `latitud` FLOAT NULL,
  `altitud` FLOAT NULL,
  `Departamentos_id` INT NOT NULL,
  PRIMARY KEY (`idMunicipios`),
  INDEX `fk_Municipios_Departamentos1_idx` (`Departamentos_id` ASC) ,
  CONSTRAINT `fk_Municipios_Departamentos1`
    FOREIGN KEY (`Departamentos_id`)
    REFERENCES `mydb`.`Departamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Informacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Informacion` (
  `idInformacion` INT NOT NULL AUTO_INCREMENT,
  `nacimiento` DATE NOT NULL,
  `telefono` INT NOT NULL,
  `longitud` FLOAT NOT NULL,
  `latitud` FLOAT NOT NULL,
  `altitud` FLOAT NOT NULL,
  `Direccion` VARCHAR(150) NOT NULL,
  `Municipios_idMunicipios` INT NOT NULL,
  PRIMARY KEY (`idInformacion`),
  INDEX `fk_Informacion_Municipios1_idx` (`Municipios_idMunicipios` ASC) ,
  CONSTRAINT `fk_Informacion_Municipios1`
    FOREIGN KEY (`Municipios_idMunicipios`)
    REFERENCES `mydb`.`Municipios` (`idMunicipios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(150) NULL,
  `user` VARCHAR(45) NULL,
  `pswd` VARCHAR(25) NULL,
  `Estado` INT NULL,
  `informacion_id` INT NOT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_User_Informacion_idx` (`informacion_id` ASC) ,
  CONSTRAINT `fk_User_Informacion`
    FOREIGN KEY (`informacion_id`)
    REFERENCES `mydb`.`Informacion` (`idInformacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servicios` (
  `idServicios` INT NOT NULL AUTO_INCREMENT,
  `nombre_servicio` VARCHAR(45) NOT NULL,
  `estado` INT NOT NULL,
  `Informacion_idInformacion` INT NOT NULL,
  PRIMARY KEY (`idServicios`),
  INDEX `fk_Servicios_Informacion1_idx` (`Informacion_idInformacion` ASC) ,
  CONSTRAINT `fk_Servicios_Informacion1`
    FOREIGN KEY (`Informacion_idInformacion`)
    REFERENCES `mydb`.`Informacion` (`idInformacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ranking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ranking` (
  `idrank` INT NOT NULL AUTO_INCREMENT,
  `contrataciones` INT NULL,
  `rank` INT NULL,
  `Informacion_idInformacion` INT NOT NULL,
  PRIMARY KEY (`idrank`),
  INDEX `fk_ranking_Informacion1_idx` (`Informacion_idInformacion` ASC) ,
  CONSTRAINT `fk_ranking_Informacion1`
    FOREIGN KEY (`Informacion_idInformacion`)
    REFERENCES `mydb`.`Informacion` (`idInformacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

