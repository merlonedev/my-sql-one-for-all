CREATE VIEW top_3_artistas AS 
SELECT
    a.nome AS 'artista',
    COUNT(us.usuario_id) AS 'seguidores'
FROM
    artistas AS a
    JOIN
    usuario_seguindo AS us ON us.artista_id = a.id
GROUP BY `artista`
ORDER BY `seguidores` DESC , `artista`
LIMIT 3;
