DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN param_artista varchar(50))
BEGIN
  SELECT ART.nome AS artista,
  ALB.nome AS album
  FROM SpotifyClone.album ALB
  INNER JOIN SpotifyClone.artista ART
  ON ART.id_artista = ALB.id_artista
  HAVING artista = param_artista
  ORDER BY album;
END $$

DELIMITER ;
