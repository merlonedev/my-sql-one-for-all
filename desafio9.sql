DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN
SELECT
ar.nome AS artista,
al.nome AS album
FROM SpotifyClone.artista AS ar
INNER JOIN SpotifyClone.album AS al ON ar.id_artista = al.id_artista
WHERE ar.nome LIKE CONCAT('%', nome, '%')
ORDER BY album;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
