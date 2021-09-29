DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeDoArtista VARCHAR(50))
BEGIN

SELECT 
    Artist AS 'artista', Album AS 'album'
FROM
    albums
        JOIN
    artists ON albums.Artist_ID = artists.Artist_ID
HAVING Artist = nomeDoArtista
ORDER BY 2;

END $$

DELIMITER ;
