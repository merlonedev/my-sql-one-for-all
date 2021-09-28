DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(60))
  BEGIN
    SELECT 
      a.name AS `artista`,
      ab.title AS `album`
    FROM SpotifyClone.albums AS ab
      INNER JOIN SpotifyClone.artists AS a ON a.id = ab.artist
    WHERE a.name = artist
    ORDER BY `album`;
  END $$
DELIMITER ;
