CREATE VIEW estatisticas_musicais AS
SELECT COUNT(c.id) AS `cancoes`,
COUNT(DISTINCT(a.nome)) AS `artistas`,
COUNT(DISTINCT(al.nome)) AS `albuns`
FROM cancoes AS c
INNER JOIN albuns AS al
ON al.id = c.album_id
INNER JOIN artistas AS a
ON a.id = al.artista_id;
