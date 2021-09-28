SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `mydb` ;

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`plano` (
  `plano_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(25) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `usuario_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(20) NOT NULL,
  `idade` INT UNSIGNED NOT NULL,
  `plano_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_usuario_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_plano`
    FOREIGN KEY (`plano_id`)
    REFERENCES `mydb`.`plano` (`plano_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mydb`.`artista` (
  `artista_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mydb`.`album` (
  `album_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  `artista_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `fk_album_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_album`
    FOREIGN KEY (`artista_id`)
    REFERENCES `mydb`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mydb`.`cancao` (
  `cancao_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(45) NULL,
  `album_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cancao_id`),
  INDEX `fk_cancao_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancao`
    FOREIGN KEY (`album_id`)
    REFERENCES `mydb`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mydb`.`usuario_artista` (
  `usuario_id` INT UNSIGNED NOT NULL,
  `artista_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  INDEX `fk_usuario_has_artista_artista1_idx` (`artista_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_artista_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_artista_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artista_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `mydb`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mydb`.`usuario_cancao` (
  `usuario_id` INT UNSIGNED NOT NULL,
  `cancao_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  INDEX `fk_usuario_has_cancao_cancao1_idx` (`cancao_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_cancao_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_cancao_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_cancao_cancao1`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `mydb`.`cancao` (`cancao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
