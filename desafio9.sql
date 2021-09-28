DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(32))
BEGIN
SELECT
  ar.artista
AS
  `artista`,
  al.album
AS
  `album`
FROM
  SpotifyClone.artistas ar
INNER JOIN
  SpotifyClone.albuns al
ON
  al.artista_id = ar.artista_id
WHERE
  ar.artista = nome_artista;
ORDER BY
  `artista`
END $$

DELIMITER ;