DELIMITER $$ 
CREATE PROCEDURE albuns_do_artista(IN username VARCHAR(50)) BEGIN
SELECT
  username AS artista,
  a.album
FROM
  album a
WHERE
  a.artista_id = (
    SELECT
      id
    FROM
      artista
    WHERE
      artista = username
  )
ORDER BY
  a.album ASC;

END $$ 
DELIMITER;
