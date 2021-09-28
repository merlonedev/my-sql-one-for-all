DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN name NVARCHAR(100))
BEGIN
SELECT 
    at.artist_name AS artista, al.album_name AS album
FROM
    artists at
        INNER JOIN
    albums al ON at.artist_id = al.artist_id
WHERE
    at.artist_name = name
;
END $$

DELIMITER ;