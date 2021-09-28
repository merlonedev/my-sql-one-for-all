CREATE VIEW perfil_artistas AS
SELECT ar.artista AS artista, al.album AS album, COUNT(s.user_id) AS seguidores
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id 
INNER JOIN SpotifyClone.seguidores AS s
ON ar.artista_id = s.artista_id
GROUP BY `artista`,`album`
ORDER BY `seguidores` DESC, `artista`, `album`;
