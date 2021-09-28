delimiter $$

CREATE PROCEDURE albuns_do_artista(in artista_name varchar(50)) 
BEGIN
	Select artista_name as artista, album_name as album from SpotfiyClone.artists as a
    inner join 
    SpotfiyClone.albums as al on a.artist_id = al.artist_id
    Order by album_name ASC;
END $$

delimiter ;
