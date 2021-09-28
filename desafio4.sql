CREATE VIEW top_3_artistas AS
SELECT 
artistas.nome_artista AS `artista`,
COUNT(seguidores.id_usuario) AS `seguidores`
FROM
tb_artistas_usuarios AS seguidores
JOIN tb_artistas AS artistas ON artistas.id_artista = seguidores.id_artista
GROUP BY `artista`
ORDER BY `seguidores` DESC , `artista` ASC
LIMIT 3;
