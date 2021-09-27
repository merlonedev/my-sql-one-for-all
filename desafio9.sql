DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(50))
BEGIN
SELECT
AR.nome_artista AS artista,
AL.album_name AS album
FROM SpotifyClone.artistas AR
JOIN SpotifyClone.albuns AL
ON AR.artista_id = AL.artista_id
WHERE AR.nome_artista = nome;
END $$
DELIMITER ;
