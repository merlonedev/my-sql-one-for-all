USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN artista VARCHAR(45))
BEGIN
	SELECT
		a.name AS artista,
        al.title AS album
	FROM
		SpotifyClone.artists AS a
			INNER JOIN
		SpotifyClone.albuns AS al ON al.artist_id = a.artist_id
	WHERE
		a.name LIKE CONCAT('%', artista, '%' )
	ORDER BY `album`;
END $$
DELIMITER ;
