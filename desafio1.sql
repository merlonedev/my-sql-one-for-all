DROP DATABASE IF EXISTS SpotifyClone;

Create DATABASE SpotifyClone;

Create Table SpotifyClone.plans (
plan_id int primary key auto_increment,
plan_name varchar(20) not null,
price decimal(5,2) not null
);

INSERT into SpotifyClone.plans (plan_name, price) 
VALUES("gratuito", 0),
("universitário", 5.99),
("familiar", 7.99);

Create Table SpotifyClone.users (
user_id int primary key auto_increment,
username varchar(50) not null,
age int not null,
plan_id int not null,
foreign key (plan_id) references plans(plan_id)
);

INSERT INTO SpotifyClone.users (username, age, plan_id) 
VALUES ("Thati", 23, 1),
("Cintia", 35, 3),
("Bill", 20, 2),
("Roger", 45, 1);

Create Table SpotifyClone.artists (
artist_id int primary key auto_increment,
artist_name varchar(50) not null
);

INSERT INTO SpotifyClone.artists (artist_name)
VALUES("Walter Phoenix"),
("Peter Strong"),
("Lance Day"),
("Freddie Shannon");

Create Table SpotifyClone.albums (
album_id int primary key auto_increment,
album_name varchar(50) not null,
artist_id int not null,
foreign key (artist_id) references artists(artist_id)
);

INSERT INTO SpotifyClone.albums (album_name, artist_id)
VALUES("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 2),
("Incandescent", 3),
("Temporary Culture", 4);

Create Table SpotifyClone.songs (
song_id int primary key auto_increment,
song_name varchar(50) not null,
album_id int not null,
artist_id int not null,
foreign key (artist_id) references artists(artist_id),
foreign key (album_id) references albums(album_id)
);

INSERT INTO SpotifyClone.songs (song_name, album_id, artist_id)
VALUES ("Soul For Us", 1, 1),
("Reflections Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 2, 1),
("Time Fireworks", 2, 1),
("Magic Circus", 3, 2),
("Honey, So Do I", 3, 2),
("Sweetie, Let's Go Wild", 3, 2),
("She Knows", 3, 2),
("Fantasy For Me", 4, 3),
("Celebration Of More", 4, 3),
("Rock His Everything", 4, 3),
("Home Forever", 4, 3),
("Diamond Power", 4, 3),
("Honey, Let's Be Silly", 4, 3),
("Thang Of Thunder", 5, 4),
("Words Of Her Life", 5, 4),
("Without My Streets", 5, 4);

Create Table SpotifyClone.histories (
history_id int unique auto_increment,
user_id int not null,
song_id int not null,
constraint primary key (user_id, song_id),
foreign key (user_id) references users(user_id),
foreign key (song_id) references songs(song_id)
);

INSERT INTO SpotifyClone.histories (user_id, song_id)
VALUES (1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);

Create Table SpotifyClone.user_follow (
user_id int not null,
artist_id int not null,
constraint primary key(user_id, artist_id)
foreign key (user_id) references users(user_id),
foreign key (artist_id) references artists(artist_id)
);

INSERT INTO SpotifyClone.user_follow (user_id, artist_id) 
VALUES (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
