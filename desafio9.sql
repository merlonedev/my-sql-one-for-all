DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(30))
BEGIN
	SELECT a.artist artista, am.album album FROM artists a
	JOIN albums am ON am.artist_id = a.artist_id
	WHERE a.artist = artist_name
	ORDER BY album;
END $$
DELIMITER ;
