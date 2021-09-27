CREATE VIEW top_3_artistas AS
SELECT
A.nome_artista AS artista,
COUNT(S.artista_id) AS seguidores
FROM SpotifyClone.artistas A
JOIN SpotifyClone.seguindoArtistas S
ON A.artista_id = S.artista_id
GROUP BY A.nome_artista
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
