CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT m.nome) AS cancoes,
COUNT(DISTINCT a.nome) AS artistas,
COUNT(DISTINCT m.id_album) AS albuns
FROM SpotifyClone.musica AS m
INNER JOIN SpotifyClone.artista AS a;
