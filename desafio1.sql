-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`Plans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Plans` (
  `PLAN_ID` INT NOT NULL AUTO_INCREMENT,
  `PLAN_NAME` VARCHAR(20) NOT NULL,
  `PLAN_VALUE` DECIMAL NOT NULL,
  PRIMARY KEY (`PLAN_ID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`UserDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`UserDetail` (
  `USER_ID` INT NOT NULL AUTO_INCREMENT,
  `USER_NAME` VARCHAR(20) NOT NULL,
  `AGE` INT NOT NULL,
  `PLAN_ID` INT NOT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `PLAN_ID_FK`
    FOREIGN KEY (`PLAN_ID`)
    REFERENCES `SpotifyClone`.`Plans` (`PLAN_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Artists` (
  `ARTIST_ID` INT NOT NULL AUTO_INCREMENT,
  `ARTIST_NAME` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ARTIST_ID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`Albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Albums` (
  `ALBUM_ID` INT NOT NULL,
  `ALBUM_NAME` VARCHAR(20) NULL,
  `ARTIST_ID` INT NOT NULL,
  PRIMARY KEY (`ALBUM_ID`),
  CONSTRAINT `ARTIST_ID_FK`
    FOREIGN KEY (`ARTIST_ID`)
    REFERENCES `SpotifyClone`.`Artists` (`ARTIST_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`Songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Songs` (
  `SONG_ID` INT NOT NULL,
  `SONG_NAME` VARCHAR(100) NOT NULL,
  `ARTIST_ID` INT NOT NULL,
  `ALBUM_ID` INT NOT NULL,
  PRIMARY KEY (`SONG_ID`),
  CONSTRAINT `FK_ARTIST_ID`
    FOREIGN KEY (`ARTIST_ID`)
    REFERENCES `SpotifyClone`.`Artists` (`ARTIST_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `ALBUM_ID_FK`
    FOREIGN KEY (`ALBUM_ID`)
    REFERENCES `SpotifyClone`.`Albums` (`ALBUM_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`History`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`History` (
  `USER_ID` INT NOT NULL,
  `SONG_ID` INT NOT NULL,
  PRIMARY KEY (`USER_ID`, `SONG_ID`),
  CONSTRAINT `USER_ID_PK`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `SpotifyClone`.`UserDetail` (`USER_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `SONG_ID_PK`
    FOREIGN KEY (`SONG_ID`)
    REFERENCES `SpotifyClone`.`Songs` (`SONG_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`Followers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Followers` (
  `USER_ID` INT NOT NULL,
  `ARTIST_ID` INT NOT NULL,
  PRIMARY KEY (`USER_ID`, `ARTIST_ID`),
  CONSTRAINT `USER_IDFK`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `SpotifyClone`.`UserDetail` (`USER_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `ARTIST_IDFK`
    FOREIGN KEY (`ARTIST_ID`)
    REFERENCES `SpotifyClone`.`Artists` (`ARTIST_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`Plans`
-- -----------------------------------------------------
INSERT INTO `SpotifyClone`.`Plans` (`PLAN_ID`, `PLAN_NAME`, `PLAN_VALUE`) VALUES (1, 'gratuito', 0);
INSERT INTO `SpotifyClone`.`Plans` (`PLAN_ID`, `PLAN_NAME`, `PLAN_VALUE`) VALUES (2, 'universitário', 5.99);
INSERT INTO `SpotifyClone`.`Plans` (`PLAN_ID`, `PLAN_NAME`, `PLAN_VALUE`) VALUES (3, 'familiar', 7.99);

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`UserDetail`
-- -----------------------------------------------------
INSERT INTO `SpotifyClone`.`UserDetail` (`USER_ID`, `USER_NAME`, `AGE`, `PLAN_ID`) VALUES (1, 'Thati', 23, 1);
INSERT INTO `SpotifyClone`.`UserDetail` (`USER_ID`, `USER_NAME`, `AGE`, `PLAN_ID`) VALUES (2, 'Cintia', 35, 3);
INSERT INTO `SpotifyClone`.`UserDetail` (`USER_ID`, `USER_NAME`, `AGE`, `PLAN_ID`) VALUES (3, 'Bill', 20, 2);
INSERT INTO `SpotifyClone`.`UserDetail` (`USER_ID`, `USER_NAME`, `AGE`, `PLAN_ID`) VALUES (4, 'Roger', 45, 1);

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`Artists`
-- -----------------------------------------------------
INSERT INTO `SpotifyClone`.`Artists` (`ARTIST_ID`, `ARTIST_NAME`) VALUES (1, 'Walter Phoenix');
INSERT INTO `SpotifyClone`.`Artists` (`ARTIST_ID`, `ARTIST_NAME`) VALUES (2, 'Peter Strong');
INSERT INTO `SpotifyClone`.`Artists` (`ARTIST_ID`, `ARTIST_NAME`) VALUES (3, 'Lance Day');
INSERT INTO `SpotifyClone`.`Artists` (`ARTIST_ID`, `ARTIST_NAME`) VALUES (4, 'Freedie Shannon');

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`Albums`
-- -----------------------------------------------------
INSERT INTO `SpotifyClone`.`Albums` (`ALBUM_ID`, `ALBUM_NAME`, `ARTIST_ID`) VALUES (1, 'Envious', 1);
INSERT INTO `SpotifyClone`.`Albums` (`ALBUM_ID`, `ALBUM_NAME`, `ARTIST_ID`) VALUES (2, 'Exuberant', 1);
INSERT INTO `SpotifyClone`.`Albums` (`ALBUM_ID`, `ALBUM_NAME`, `ARTIST_ID`) VALUES (3, 'Hallowed Steam', 2);
INSERT INTO `SpotifyClone`.`Albums` (`ALBUM_ID`, `ALBUM_NAME`, `ARTIST_ID`) VALUES (4, 'Incandescent', 3);
INSERT INTO `SpotifyClone`.`Albums` (`ALBUM_ID`, `ALBUM_NAME`, `ARTIST_ID`) VALUES (5, 'Temporary Culture', 4);

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`Songs`
-- -----------------------------------------------------
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (1, 'Soul For Us', 1, 1);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (2, 'Reflections Of Magic', 1, 1);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (3, 'Dance With Her Own', 1, 1);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (4, 'Troubles Of My Inner Fire', 1, 2);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (5, 'Time Fireworks', 1, 2);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (6, 'Magic Circus', 2, 3);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (7, 'Honey, So Do I', 2, 3);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (8, 'Sweetie, Let\'s Go Wild', 2, 3);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (9, 'She Knows\"', 2, 3);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (10, 'Fantasy For Me', 3, 4);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (11, 'Celebration Of More', 3, 4);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (12, 'Rock His Everything', 3, 4);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (13, 'Home Forever', 3, 4);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (14, 'Diamond Power', 3, 4);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (15, 'Honey, Let\'s Be Silly', 3, 4);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (16, 'Thang Of Thunder', 4, 5);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (17, 'Words Of Her Life', 4, 5);
INSERT INTO `SpotifyClone`.`Songs` (`SONG_ID`, `SONG_NAME`, `ARTIST_ID`, `ALBUM_ID`) VALUES (18, 'Without My Streets', 4, 5);

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`History`
-- -----------------------------------------------------
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (1, 6);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (1, 14);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (1, 16);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (2, 13);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (2, 17);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (2, 2);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (2, 15);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (3, 4);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (3, 16);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (3, 6);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (4, 3);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (4, 18);
INSERT INTO `SpotifyClone`.`History` (`USER_ID`, `SONG_ID`) VALUES (4, 11);

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`Followers`
-- -----------------------------------------------------
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (1, 4);
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (1, 3);
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (2, 1);
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (2, 3);
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (3, 2);
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (3, 1);
INSERT INTO `SpotifyClone`.`Followers` (`USER_ID`, `ARTIST_ID`) VALUES (4, 4);
