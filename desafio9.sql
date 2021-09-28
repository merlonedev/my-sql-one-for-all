DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_solicitado VARCHAR(20))
BEGIN
SELECT ar.nome_artista AS artista,
al.nome_album AS album
FROM artistas AS ar
JOIN albuns AS al
ON ar.artista_id = al.artista_id
WHERE nome_artista LIKE CONCAT('%', nome_solicitado, '%');
END $$

DELIMITER ;
