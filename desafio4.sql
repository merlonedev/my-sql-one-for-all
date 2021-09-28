CREATE VIEW top_3_artistas AS
SELECT
artistas.nome AS artista, count(usuarios.nome) AS seguidores
FROM usuario_artistas
JOIN
usuarios ON usuario_artistas.usuario_id = usuarios.usuario_id
JOIN
artistas ON artistas.artista_id = usuario_artistas.artista_id
GROUP BY artista 
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
-- DROP VIEW top_3_artistas;
