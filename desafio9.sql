DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(60))
BEGIN
DECLARE artistID INT;
SELECT id FROM SpotifyClone.artists WHERE name LIKE artistName INTO artistID;
SELECT
art.name AS `artista`,
alb.name AS `album`
FROM SpotifyClone.albums AS alb
JOIN SpotifyClone.artists AS art ON alb.artist_id = art.id
WHERE artist_id = artistID;
END $$

DELIMITER ;
