CREATE DATABASE IF NOT EXISTS SpotifyClone;
-- DROP DATABASE IF EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(15) NOT NULL,
    `price` DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL,
    `plan` INT NOT NULL,
    FOREIGN KEY (plan) REFERENCES SpotifyClone.plans(`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.user_artist (
	`user_id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    PRIMARY KEY (`user_id`,`artist_id`),
    FOREIGN KEY (`user_id`) REFERENCES SpotifyClone.users(`id`),
    FOREIGN KEY (`artist_id`) REFERENCES SpotifyClone.artists(`id`)
) engine = InnoDB;


CREATE TABLE SpotifyClone.albums (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL,
    `artist_id` INT NOT NULL,
    FOREIGN KEY (`artist_id`) REFERENCES SpotifyClone.artists(`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL,
    `artist_id` INT NOT NULL,
    `album_id` INT NOT NULL,
    FOREIGN KEY (`artist_id`) REFERENCES SpotifyClone.artists(`id`),
    FOREIGN KEY (`album_id`) REFERENCES SpotifyClone.albums(`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.user_song (
	`user_id` INT NOT NULL,
    `song_id` INT NOT NULL,
    PRIMARY KEY (`user_id`, `song_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`song_id`) REFERENCES `songs`(`id`)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (`name`, `price`)
VALUES
	('gratuito', 0),
	('familiar', 7.99),
	('universitário', 5.99);
    
INSERT INTO SpotifyClone.users (`name`, `plan`)
VALUES
	('Thati', 1),
	('Cintia', 2),
	('Bill', 3),
    ('Roger', 1);
    
INSERT INTO SpotifyClone.artists (`name`)
VALUES
	('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO SpotifyClone.albums (`name`, `artist_id`)
VALUES
	('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);
    
INSERT INTO SpotifyClone.songs (`name`, `artist_id`, `album_id`)
VALUES
	('Soul For Us', 1, 1),
    ('Reflections Of Magic', 1, 1),
    ('Dance With Her Own', 1, 1),
    ('Troubles Of My Inner Fire', 1, 2),
    ('Time Fireworks', 1, 2),

    ('Magic Circus', 2, 3),
    ('Honey, So Do I', 2, 3),
    ("Sweetie, Let's Go Wild", 2, 3),
    ('She Knows', 2, 3),
    
    ('Fantasy For Me', 3, 4),
    ('Celebration Of More', 3, 4),
    ('Rock His Everything', 3, 4),
    ('Home Forever', 3, 4),
    ('Diamond Power', 3, 4),
    ("Honey, Let's Be Silly", 3, 4),
    
    ("Thang Of Thunder", 4, 5),
    ("Words Of Her Life", 4, 5),
    ("Without My Streets", 4, 5);

INSERT INTO SpotifyClone.user_artist (`user_id`, `artist_id`)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),

    (2, 1),
    (2, 3),

    (3, 2),
    (3, 1),

    (4, 4);


INSERT INTO SpotifyClone.user_song (`user_id`, `song_id`)
VALUES
    (1, 1),
    (1, 6),
    (1, 14),
    (1, 16),

    (2, 13),
    (2, 17),
    (2, 2),
    (2, 15),

    (3, 4),
    (3, 16),
    (3, 2),

    (4, 3),
    (4, 18),
    (4, 11);
