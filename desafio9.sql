DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN `name` VARCHAR(40))
  BEGIN
    SELECT 
      ar.`name` AS `artista`,
      al.title AS `album`
    FROM SpotifyClone.albums AS al
      INNER JOIN SpotifyClone.artists AS ar ON a.id = al.artist
    WHERE a.`name` = `name`
    ORDER BY `album`;
  END $$
DELIMITER ;
