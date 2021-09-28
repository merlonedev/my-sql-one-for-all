CREATE VIEW perfil_artistas AS
SELECT A.artista AS 'artista', AL.album AS 'album', COUNT(US.artista_id) AS 'seguidores'
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.usuario_seguindo_artistas AS US ON US.artista_id = A.artista_id
INNER JOIN SpotifyClone.albuns AS AL ON AL.artista_id = US.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;

-- SELECT nome AS 'album',
--     (SELECT nome,
--         (SELECT COUNT(artista_id) FROM SpotifyClone.usuario_seguindo_artistas AS US
--         WHERE US.artista_id = AL.artista_id) AS 'seguidores'
--     FROM SpotifyClone.artista AS AL
--     WHERE AL.artista_id = A.artista_id) AS 'artista'
-- FROM SpotifyClone.album AS A;
