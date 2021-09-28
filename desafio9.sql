DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(100))
BEGIN
SELECT 
    art.`name` AS artista, alb.title AS album
FROM
    SpotifyClone.album AS alb
        JOIN
    SpotifyClone.artist AS art ON alb.artist_id = art.id
WHERE art.`name` = artist_name
ORDER BY album;
END $$

DELIMITER ;
