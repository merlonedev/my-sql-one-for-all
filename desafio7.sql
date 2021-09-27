CREATE VIEW perfil_artistas AS
SELECT
A.nome_artista AS artista,
AL.album_name AS album,
COUNT(SA.artista_id) AS seguidores
FROM SpotifyClone.artistas A
JOIN SpotifyClone.albuns AL
ON A.artista_id = AL.artista_id
JOIN SpotifyClone.seguindoArtistas SA
ON A.artista_id = SA.artista_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;
