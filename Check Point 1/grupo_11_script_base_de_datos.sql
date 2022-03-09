-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema laAprobacion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laAprobacion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laAprobacion` DEFAULT CHARACTER SET utf8 ;
USE `laAprobacion` ;

-- -----------------------------------------------------
-- Table `laAprobacion`.`decoracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`decoracion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_decoracion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`tipo_habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`tipo_habitacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `costo_diario` FLOAT(6,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`servicio_basico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`servicio_basico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`habitacion` (
  `id` INT NOT NULL,
  `numero_habitacion` TINYINT(3) NULL,
  `capacidad_maxima` TINYINT(2) NULL,
  `decoracion_id` INT NOT NULL,
  `tipo_habitacion_id` INT NOT NULL,
  `servicio_basico_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_habitacion_decoracion_idx` (`decoracion_id` ASC) VISIBLE,
  INDEX `fk_habitacion_tipo_habitacion1_idx` (`tipo_habitacion_id` ASC) VISIBLE,
  INDEX `fk_habitacion_servicio_basico1_idx` (`servicio_basico_id` ASC) VISIBLE,
  CONSTRAINT `fk_habitacion_decoracion`
    FOREIGN KEY (`decoracion_id`)
    REFERENCES `laAprobacion`.`decoracion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitacion_tipo_habitacion1`
    FOREIGN KEY (`tipo_habitacion_id`)
    REFERENCES `laAprobacion`.`tipo_habitacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitacion_servicio_basico1`
    FOREIGN KEY (`servicio_basico_id`)
    REFERENCES `laAprobacion`.`servicio_basico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`pais` (
  `id` INT NOT NULL,
  `nombre_pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`dato_personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`dato_personal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_nacimiento` DATE NULL,
  `domicilio` VARCHAR(50) NULL,
  `telefono` VARCHAR(45) NULL,
  `email` VARCHAR(70) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`empleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_legajo` INT NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `dni` INT NOT NULL,
  `pais_id` INT NOT NULL,
  `dato_personal_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_empleado_pais1_idx` (`pais_id` ASC) VISIBLE,
  INDEX `fk_empleado_dato_personal1_idx` (`dato_personal_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `laAprobacion`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_dato_personal1`
    FOREIGN KEY (`dato_personal_id`)
    REFERENCES `laAprobacion`.`dato_personal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`registro_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`registro_empleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` TINYINT(1) NOT NULL,
  `empleado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_registro_empleado_empleado1_idx` (`empleado_id` ASC) VISIBLE,
  CONSTRAINT `fk_registro_empleado_empleado1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `laAprobacion`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`huesped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`huesped` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL,
  `apellido` VARCHAR(45) NULL,
  `pasaporte` VARCHAR(25) NULL,
  `pais_id` INT NOT NULL,
  `dato_personal_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_huesped_pais1_idx` (`pais_id` ASC) VISIBLE,
  INDEX `fk_huesped_dato_personal1_idx` (`dato_personal_id` ASC) VISIBLE,
  CONSTRAINT `fk_huesped_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `laAprobacion`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_huesped_dato_personal1`
    FOREIGN KEY (`dato_personal_id`)
    REFERENCES `laAprobacion`.`dato_personal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`forma_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`forma_pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_pago` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`check_in` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_entrada` DATE NULL,
  `fecha_salida` DATE NULL,
  `importe` FLOAT(7,2) NULL,
  `forma_pago_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_check_in_forma_pago1_idx` (`forma_pago_id` ASC) VISIBLE,
  CONSTRAINT `fk_check_in_forma_pago1`
    FOREIGN KEY (`forma_pago_id`)
    REFERENCES `laAprobacion`.`forma_pago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`servicio_extra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`servicio_extra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `costo_por_hora` FLOAT(7,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`sector` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_sector` VARCHAR(45) NULL,
  `empleado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sector_empleado1_idx` (`empleado_id` ASC) VISIBLE,
  CONSTRAINT `fk_sector_empleado1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `laAprobacion`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`reserva` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servicio_extra_id` INT NOT NULL,
  `huesped_id` INT NOT NULL,
  `fecha_hora` DATETIME NULL,
  `importe` FLOAT(7,2) NULL,
  `cantidad_horas` TINYINT(2) NULL,
  `forma_pago_id` INT NOT NULL,
  INDEX `fk_servicio_extra_has_huesped_huesped1_idx` (`huesped_id` ASC) VISIBLE,
  INDEX `fk_servicio_extra_has_huesped_servicio_extra1_idx` (`servicio_extra_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_reserva_forma_pago1_idx` (`forma_pago_id` ASC) VISIBLE,
  CONSTRAINT `fk_servicio_extra_has_huesped_servicio_extra1`
    FOREIGN KEY (`servicio_extra_id`)
    REFERENCES `laAprobacion`.`servicio_extra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_extra_has_huesped_huesped1`
    FOREIGN KEY (`huesped_id`)
    REFERENCES `laAprobacion`.`huesped` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_forma_pago1`
    FOREIGN KEY (`forma_pago_id`)
    REFERENCES `laAprobacion`.`forma_pago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`habitacion_x_check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`habitacion_x_check_in` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habitacion_id` INT NOT NULL,
  `check_in_id` INT NOT NULL,
  INDEX `fk_habitacion_has_check_in_check_in1_idx` (`check_in_id` ASC) VISIBLE,
  INDEX `fk_habitacion_has_check_in_habitacion1_idx` (`habitacion_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_habitacion_has_check_in_habitacion1`
    FOREIGN KEY (`habitacion_id`)
    REFERENCES `laAprobacion`.`habitacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitacion_has_check_in_check_in1`
    FOREIGN KEY (`check_in_id`)
    REFERENCES `laAprobacion`.`check_in` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laAprobacion`.`huesped_x_check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laAprobacion`.`huesped_x_check_in` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `huesped_id` INT NOT NULL,
  `check_in_id` INT NOT NULL,
  INDEX `fk_huesped_has_check_in_check_in1_idx` (`check_in_id` ASC) VISIBLE,
  INDEX `fk_huesped_has_check_in_huesped1_idx` (`huesped_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_huesped_has_check_in_huesped1`
    FOREIGN KEY (`huesped_id`)
    REFERENCES `laAprobacion`.`huesped` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_huesped_has_check_in_check_in1`
    FOREIGN KEY (`check_in_id`)
    REFERENCES `laAprobacion`.`check_in` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
