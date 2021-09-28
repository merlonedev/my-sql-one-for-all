CREATE VIEW top_3_artistas AS
SELECT 
  artistas.nome_artista AS `artista`, COUNT(seguidores.id_usuario) AS `seguidores`
FROM
  tb_artistas AS artistas
    JOIN
  tb_artistas_usuarios AS seguidores ON seguidores.id_artista = artistas.id_artista
GROUP BY `artista`
ORDER BY `seguidores` DESC , `artista`
LIMIT 3;
