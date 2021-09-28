USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(100))
BEGIN
	SELECT
		si.singer_name AS 'artista',
        a.album_name AS 'album'
    FROM SpotifyClone.singer AS si 
    JOIN SpotifyClone.album AS a ON a.singer_id = si.singer_id
    WHERE si.singer_name = artista
    ORDER BY album;
END $$
DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix');
