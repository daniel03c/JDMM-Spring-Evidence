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
-- Table `hospital`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`hospital` (
  `clave_hospital` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `direccion` VARCHAR(80) NULL DEFAULT NULL,
  `telefono` INT(12) NULL DEFAULT NULL,
  PRIMARY KEY (`clave_hospital`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`consultorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`consultorio` (
  `clave_consultorio` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `Hospitalclave_hospital` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`clave_consultorio`),
  INDEX `FKConsultori402846` (`Hospitalclave_hospital` ASC),
  CONSTRAINT `FKConsultori402846`
    FOREIGN KEY (`Hospitalclave_hospital`)
    REFERENCES `hospital`.`hospital` (`clave_hospital`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`doctor` (
  `cedula` VARCHAR(7) NOT NULL,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `telefono` INT(10) NULL DEFAULT NULL,
  `correo` VARCHAR(30) NULL DEFAULT NULL,
  `Consultorioclave_consultorio` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cedula`),
  INDEX `FKDoctor854451` (`Consultorioclave_consultorio` ASC),
  CONSTRAINT `FKDoctor854451`
    FOREIGN KEY (`Consultorioclave_consultorio`)
    REFERENCES `hospital`.`consultorio` (`clave_consultorio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`paciente` (
  `clave_paciente` VARCHAR(18) NOT NULL,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `fecha_nac` VARCHAR(20) NULL DEFAULT NULL,
  `telefono` INT(10) NULL DEFAULT NULL,
  `tipo_sangre` VARCHAR(11) NULL DEFAULT NULL,
  `direccion` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`clave_paciente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`cita` (
  `folio` VARCHAR(20) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `hora` TIME NULL DEFAULT NULL,
  `Doctorcedula` VARCHAR(7) NOT NULL,
  `Pacienteclave_paciente` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`folio`),
  INDEX `FKCita277007` (`Doctorcedula` ASC),
  INDEX `FKCita278929` (`Pacienteclave_paciente` ASC),
  CONSTRAINT `FKCita277007`
    FOREIGN KEY (`Doctorcedula`)
    REFERENCES `hospital`.`doctor` (`cedula`),
  CONSTRAINT `FKCita278929`
    FOREIGN KEY (`Pacienteclave_paciente`)
    REFERENCES `hospital`.`paciente` (`clave_paciente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`especialidad` (
  `id_especialidad` INT(3) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`especialidad_doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`especialidad_doctor` (
  `Especialidadid_especialidad` INT(3) NOT NULL,
  `Doctorcedula` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`Especialidadid_especialidad`, `Doctorcedula`),
  INDEX `FKEspecialid32038` (`Especialidadid_especialidad` ASC),
  INDEX `FKEspecialid325523` (`Doctorcedula` ASC),
  CONSTRAINT `FKEspecialid32038`
    FOREIGN KEY (`Especialidadid_especialidad`)
    REFERENCES `hospital`.`especialidad` (`id_especialidad`),
  CONSTRAINT `FKEspecialid325523`
    FOREIGN KEY (`Doctorcedula`)
    REFERENCES `hospital`.`doctor` (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`receta` (
  `folio` VARCHAR(20) NOT NULL,
  `fecha` VARCHAR(20) NULL DEFAULT NULL,
  `observaciones` VARCHAR(80) NULL DEFAULT NULL,
  `Citafolio` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`folio`),
  INDEX `FKReceta359722` (`Citafolio` ASC),
  CONSTRAINT `FKReceta359722`
    FOREIGN KEY (`Citafolio`)
    REFERENCES `hospital`.`cita` (`folio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
