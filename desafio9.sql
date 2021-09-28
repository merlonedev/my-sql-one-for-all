delimiter $$

CREATE PROCEDURE albuns_do_artista(in artista varchar(50)) 
BEGIN
Select a.artist_name as artista, al.album_name as album from SpotifyClone.artists as a
inner join 
SpotifyClone.albums as al on a.artist_id = al.artist_id
where a.artist_name = artista
Order by al.album_name ASC;
END $$

delimiter ;
