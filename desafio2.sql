CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT S.song_name) AS cancoes,
COUNT(DISTINCT AR.nome_artista) AS artistas,
COUNT(DISTINCT A.album_id) AS albuns
FROM SpotifyClone.songs S
JOIN SpotifyClone.albuns A
ON S.album_id = A.album_id
JOIN SpotifyClone.artistas AR
ON A.artista_id = AR.artista_id;
