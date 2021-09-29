DELIMITER $$

CREATE PROCEDURE albuns_do_artista(artist_name VARCHAR(200))
BEGIN
	SELECT
		a.name as artista,
		al.name as album
    FROM SpotifyClone.artists a
    JOIN SpotifyClone.albums al ON al.artist_id = a.id
    WHERE a.name = artist_name
    ORDER BY album;
END $$

DELIMITER ;
