-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 ;
USE `hospital` ;

-- -----------------------------------------------------
-- Table `hospital`.`consultorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`consultorio` (
  `clave_consultorio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `Hospitalclave_hospital` INT(11) NOT NULL,
  PRIMARY KEY (`clave_consultorio`),
  INDEX `FKConsultori402846` (`Hospitalclave_hospital` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`especialidad` (
  `id_especialidad` INT(3) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`doctor` (
  `cedula` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `telefono` INT(10) NULL DEFAULT NULL,
  `correo` VARCHAR(30) NULL DEFAULT NULL,
  `Consultorioclave_consultorio` INT(11) NOT NULL,
  `Especialidadid_especialidad` INT(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  INDEX `FKDoctor854451` (`Consultorioclave_consultorio` ASC),
  INDEX `Especialidadid_especialidad` (`Especialidadid_especialidad` ASC),
  CONSTRAINT `Consultorioclave_consultorio`
    FOREIGN KEY (`Consultorioclave_consultorio`)
    REFERENCES `hospital`.`consultorio` (`clave_consultorio`),
  CONSTRAINT `Especialidadid_especialidad`
    FOREIGN KEY (`Especialidadid_especialidad`)
    REFERENCES `hospital`.`especialidad` (`id_especialidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`paciente` (
  `clave_paciente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `fecha_nac` VARCHAR(20) NULL DEFAULT NULL,
  `telefono` INT(10) NULL DEFAULT NULL,
  `tipo_sangre` VARCHAR(11) NULL DEFAULT NULL,
  `direccion` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`clave_paciente`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`cita` (
  `folio` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(50) NULL DEFAULT NULL,
  `hora` VARCHAR(50) NULL DEFAULT NULL,
  `Doctorcedula` INT(11) NOT NULL,
  `Pacienteclave_paciente` INT(11) NOT NULL,
  PRIMARY KEY (`folio`),
  INDEX `FKCita277007` (`Doctorcedula` ASC),
  INDEX `FKCita278929` (`Pacienteclave_paciente` ASC),
  CONSTRAINT `Doctorcedula`
    FOREIGN KEY (`Doctorcedula`)
    REFERENCES `hospital`.`doctor` (`cedula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Pacienteclave_paciente`
    FOREIGN KEY (`Pacienteclave_paciente`)
    REFERENCES `hospital`.`paciente` (`clave_paciente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`hospital` (
  `clave_hospital` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `direccion` VARCHAR(80) NULL DEFAULT NULL,
  `telefono` INT(12) NULL DEFAULT NULL,
  PRIMARY KEY (`clave_hospital`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`receta` (
  `folio` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(20) NULL DEFAULT NULL,
  `observaciones` VARCHAR(80) NULL DEFAULT NULL,
  `Citafolio` INT(11) NOT NULL,
  PRIMARY KEY (`folio`),
  INDEX `FKReceta359722` (`Citafolio` ASC),
  CONSTRAINT `Citafolio`
    FOREIGN KEY (`Citafolio`)
    REFERENCES `hospital`.`cita` (`folio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
