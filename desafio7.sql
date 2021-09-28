CREATE VIEW perfil_artistas AS
SELECT a.nome AS `artista`,
al.nome AS `album`,
COUNT(ua.usuario_id) AS `seguidores`
FROM artistas AS a
INNER JOIN albuns AS al
ON al.artista_id = a.id
INNER JOIN usuario_artista AS ua
ON ua.artista_id = a.id
GROUP BY `album`, `artista`
ORDER BY `seguidores` DESC, `artista`, `album`;
