DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome NVARCHAR(100))
BEGIN
    SELECT a.artist_name AS 'artista',
al.album_name AS 'album'
FROM artists a
JOIN albums al ON al.artist_id = a.artist_id
WHERE artist_name = nome
ORDER BY al.album_name;
END $$

DELIMITER ;
