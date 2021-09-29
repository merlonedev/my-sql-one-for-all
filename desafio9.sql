DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN search VARCHAR(100))
BEGIN
SELECT
A.artist_name AS "artista",
C.album_name AS "album"
FROM artists AS A
INNER JOIN albuns AS C
ON A.artist_id = C.artist_id
WHERE A.artist_name LIKE CONCAT("%",search,"%")
ORDER BY 1;
END
$$ DELIMITER ;
