DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(50))
BEGIN
    SELECT
        art.nome AS `artista`,
        alb.nome AS `album`
  FROM SpotifyClone.artistas AS art
    JOIN SpotifyClone.albuns AS alb
    ON art.artista_id = alb.artista_id WHERE art.nome = artista ORDER BY `album` ASC;
END $$

DELIMITER ;
