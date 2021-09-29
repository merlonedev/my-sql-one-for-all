DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistaNome VARCHAR(100))
BEGIN
SELECT 
    nome_artista AS 'artista', nome_album AS 'album'
FROM
    SpotifyClone.albuns AS al
        INNER JOIN
    SpotifyClone.artistas AS a ON al.artist_id = a.artista_id
WHERE
    nome_artista = artistaNome
ORDER BY album;
END $$

DELIMITER ;
