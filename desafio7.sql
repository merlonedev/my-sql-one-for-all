CREATE VIEW perfil_artistas AS
SELECT a.nome AS `artista`,
ab.nome AS `album`,
COUNT(f.artista_id) AS `seguidores`
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS ab
ON a.artista_id = ab.artista_id
INNER JOIN SpotifyClone.follow AS f
ON a.artista_id = f.artista_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
