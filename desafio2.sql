CREATE VIEW estatisticas_musicais AS
SELECT
(SELECT COUNT(*) FROM cancao) AS SpotifyClone.cancoes,
(SELECT COUNT(*) FROM artista) AS SpotifyClone.artistas,
(SELECT COUNT(*) FROM album) AS SpotifyClone.albuns;
