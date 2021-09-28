CREATE VIEW perfil_artistas AS
SELECT a.artista AS `artista`,
alb.nome AS `album`,
COUNT(s.usuario_id) AS `seguidores`
FROM artista AS a
JOIN album AS alb ON alb.artista_id = a.artista_id
JOIN seguindoartistas AS s ON s.artista_id = alb.artista_id
GROUP BY a.artista, alb.nome
ORDER BY `seguidores` DESC, `artista`, `album`;
