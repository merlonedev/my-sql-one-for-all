DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN name_artist VARCHAR(50))
BEGIN
    SELECT a.artist AS artista, al.album AS album FROM SpotifyClone.artists AS a
    JOIN SpotifyClone.albuns AS al ON a.artist_id = al.artist_id
    WHERE a.artist LIKE CONCAT('%', name_artist, '%')
    ORDER BY album;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
