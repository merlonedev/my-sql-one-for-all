CREATE PROCEDURE `albuns_do_artista`(IN nome_artista VARCHAR(45))
BEGIN
SELECT 
artistas.nome_artista AS 'artista', 
albuns.album AS 'album'
FROM tb_artistas AS `artistas` JOIN tb_albuns as albuns ON albuns.id_artista = artistas.id_artista
WHERE artistas.nome_artista = nome_artista;
END

